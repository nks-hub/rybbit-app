import 'package:riverpod/riverpod.dart';

import '../../analytics/data/analytics_repository.dart';

final sparklineProvider =
    FutureProvider.family<List<double>, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final now = DateTime.now().toUtc();
    final start = now.subtract(const Duration(hours: 24));
    final buckets = await repo.getOverviewBucketed(siteId, {
      'start_date': '${start.year}-${start.month.toString().padLeft(2, '0')}-${start.day.toString().padLeft(2, '0')}',
      'end_date': '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}',
      'time_zone': 'UTC',
      'bucket': 'hour',
    });
    if (buckets.isEmpty) return [];

    return buckets.map((b) => b.pageviews.toDouble()).toList();
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
