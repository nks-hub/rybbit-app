import 'package:riverpod/riverpod.dart';

import '../../analytics/data/analytics_repository.dart';

final sparklineProvider =
    FutureProvider.autoDispose.family<List<double>, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final now = DateTime.now().toUtc();
    final start = now.subtract(const Duration(hours: 24));
    final startDate =
        '${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}';
    final endDate =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';

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
  },
);

/// Provider for today's unique visitors per site.
final todayUsersProvider =
    FutureProvider.autoDispose.family<int, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final today = DateTime.now().toIso8601String().split('T').first;
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
  },
);
