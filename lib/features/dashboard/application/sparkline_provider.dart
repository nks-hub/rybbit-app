import 'package:riverpod/riverpod.dart';

import '../../analytics/data/analytics_repository.dart';

final sparklineProvider =
    FutureProvider.family.autoDispose<List<double>, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final buckets = await repo.getOverviewBucketed(siteId, {
      'startDate': DateTime.now()
          .subtract(const Duration(days: 7))
          .toIso8601String()
          .split('T')
          .first,
      'endDate': DateTime.now().toIso8601String().split('T').first,
      'bucket': 'day',
    });
    return buckets.map((b) => b.pageviews.toDouble()).toList();
  },
);
