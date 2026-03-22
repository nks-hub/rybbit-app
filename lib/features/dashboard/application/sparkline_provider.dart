import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../analytics/data/analytics_repository.dart';

/// Global semaphore limiting concurrent dashboard API requests to avoid
/// overloading the server when many sites are displayed simultaneously.
final _dashboardSemaphoreProvider = Provider<_Semaphore>(
  (ref) => _Semaphore(maxConcurrent: 4),
);

final sparklineProvider =
    FutureProvider.autoDispose.family<List<double>, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final semaphore = ref.watch(_dashboardSemaphoreProvider);
    final now = DateTime.now().toUtc();
    final start = now.subtract(const Duration(hours: 24));
    final startDate =
        '${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}';
    final endDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

    return semaphore.run(() async {
      // Retry once on failure (server may 500 under concurrent load)
      for (var attempt = 0; attempt < 2; attempt++) {
        try {
          final buckets = await repo.getOverviewBucketed(siteId, {
            'start_date': startDate,
            'end_date': endDate,
            'time_zone': 'UTC',
            'bucket': 'hour',
          });
          if (buckets.isEmpty) return [];
          return buckets.map((b) => b.pageviews.toDouble()).toList();
        } catch (_) {
          if (attempt == 0) {
            await Future<void>.delayed(const Duration(milliseconds: 500));
          }
        }
      }
      return [];
    });
  },
);

/// Provider for today's unique visitors per site.
final todayUsersProvider =
    FutureProvider.autoDispose.family<int, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final semaphore = ref.watch(_dashboardSemaphoreProvider);
    final today = DateTime.now().toIso8601String().split('T').first;

    return semaphore.run(() async {
      try {
        final overview = await repo.getOverview(siteId, {
          'start_date': today,
          'end_date': today,
          'time_zone': 'UTC',
        });
        return overview.users;
      } catch (_) {
        return 0;
      }
    });
  },
);

/// Simple async semaphore for bounding concurrency.
class _Semaphore {
  final int maxConcurrent;
  int _running = 0;
  final _queue = <Completer<void>>[];

  _Semaphore({required this.maxConcurrent});

  Future<T> run<T>(Future<T> Function() task) async {
    if (_running >= maxConcurrent) {
      final completer = Completer<void>();
      _queue.add(completer);
      await completer.future;
    }
    _running++;
    try {
      return await task();
    } finally {
      _running--;
      if (_queue.isNotEmpty) {
        _queue.removeAt(0).complete();
      }
    }
  }
}
