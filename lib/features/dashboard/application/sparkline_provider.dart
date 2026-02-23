import 'package:riverpod/riverpod.dart';

import '../../analytics/data/analytics_repository.dart';

final sparklineProvider =
    FutureProvider.family<List<double>, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final now = DateTime.now();
    final buckets = await repo.getOverviewBucketed(siteId, {
      'startDate': now
          .subtract(const Duration(days: 14))
          .toIso8601String()
          .split('T')
          .first,
      'endDate': now.toIso8601String().split('T').first,
      'bucket': 'day',
    });
    if (buckets.isEmpty) return [];

    // Build a complete 14-day series, filling missing days with 0
    final startDate = now.subtract(const Duration(days: 14));
    final bucketMap = <String, double>{};
    for (final b in buckets) {
      final key = b.time.split('T').first;
      bucketMap[key] = b.pageviews.toDouble();
    }

    final values = <double>[];
    for (int i = 0; i <= 14; i++) {
      final date = startDate.add(Duration(days: i));
      final key =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      values.add(bucketMap[key] ?? 0);
    }
    return values;
  },
);

/// Provider for today's unique visitors per site.
final todayUsersProvider =
    FutureProvider.family<int, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final today = DateTime.now().toIso8601String().split('T').first;
    try {
      final overview = await repo.getOverview(siteId, {
        'startDate': today,
        'endDate': today,
      });
      return overview.users;
    } catch (_) {
      return 0;
    }
  },
);
