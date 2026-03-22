import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/core/state/paginated_notifier_mixin.dart';

// ---------------------------------------------------------------------------
// Concrete test state
// ---------------------------------------------------------------------------

class _TestState {
  final List<String> items;
  final bool hasMore;
  final bool isLoadingMore;

  const _TestState({
    this.items = const [],
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  _TestState copyWith({
    List<String>? items,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return _TestState(
      items: items ?? this.items,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

// ---------------------------------------------------------------------------
// Concrete notifier implementation used in tests
// ---------------------------------------------------------------------------

typedef _FetchFn = Future<PageResult<String>> Function(_TestState);

class _TestNotifier
    extends AutoDisposeFamilyAsyncNotifier<_TestState, int>
    with PaginatedNotifierMixin<_TestState, String, int> {
  _FetchFn? _fetchFn;

  void setFetchFn(_FetchFn fn) => _fetchFn = fn;

  @override
  Future<_TestState> build(int arg) async => const _TestState();

  @override
  List<String> getItems(_TestState s) => s.items;

  @override
  PaginationInfo getPaginationInfo(_TestState s) =>
      PaginationInfo(hasMore: s.hasMore, isLoadingMore: s.isLoadingMore);

  @override
  _TestState setLoadingMore(_TestState s, {required bool value}) =>
      s.copyWith(isLoadingMore: value);

  @override
  _TestState buildNextState(
          _TestState current, List<String> trimmedItems, PageResult<String> result) =>
      current.copyWith(items: trimmedItems, hasMore: result.hasMore, isLoadingMore: false);

  @override
  Future<PageResult<String>> fetchNextPage(_TestState s) async {
    if (_fetchFn != null) return _fetchFn!(s);
    return const PageResult(items: [], hasMore: false);
  }
}

final _testProvider =
    AsyncNotifierProvider.autoDispose.family<_TestNotifier, _TestState, int>(
  _TestNotifier.new,
);

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

ProviderContainer _container() => ProviderContainer();

/// Waits until the provider has a non-loading data value.
Future<_TestState> _resolve(ProviderContainer c) async {
  // The initial build is async; wait for it.
  await c.read(_testProvider(0).future);
  return c.read(_testProvider(0)).requireValue;
}

void main() {
  group('PaginatedNotifierMixin.loadMore', () {
    test('no-op when hasMore is false', () async {
      final c = _container();
      addTearDown(c.dispose);

      await _resolve(c);

      // Set hasMore = false
      c.read(_testProvider(0).notifier).state =
          AsyncValue.data(const _TestState(hasMore: false));

      int fetchCalled = 0;
      c.read(_testProvider(0).notifier).setFetchFn((_) async {
        fetchCalled++;
        return const PageResult(items: ['x'], hasMore: false);
      });

      await c.read(_testProvider(0).notifier).loadMore();

      expect(fetchCalled, 0);
      expect(c.read(_testProvider(0)).requireValue.items, isEmpty);
    });

    test('no-op when already loading', () async {
      final c = _container();
      addTearDown(c.dispose);

      await _resolve(c);

      c.read(_testProvider(0).notifier).state = AsyncValue.data(
        const _TestState(hasMore: true, isLoadingMore: true),
      );

      int fetchCalled = 0;
      c.read(_testProvider(0).notifier).setFetchFn((_) async {
        fetchCalled++;
        return const PageResult(items: ['x'], hasMore: false);
      });

      await c.read(_testProvider(0).notifier).loadMore();

      expect(fetchCalled, 0);
    });

    test('appends items correctly', () async {
      final c = _container();
      addTearDown(c.dispose);

      await _resolve(c);

      c.read(_testProvider(0).notifier).state = AsyncValue.data(
        const _TestState(items: ['a', 'b'], hasMore: true),
      );

      c.read(_testProvider(0).notifier).setFetchFn((_) async =>
          const PageResult(items: ['c', 'd'], hasMore: false));

      await c.read(_testProvider(0).notifier).loadMore();

      final result = c.read(_testProvider(0)).requireValue;
      expect(result.items, ['a', 'b', 'c', 'd']);
      expect(result.hasMore, false);
      expect(result.isLoadingMore, false);
    });

    test('trims to maxItems when combined list exceeds limit', () async {
      final c = _container();
      addTearDown(c.dispose);

      await _resolve(c);

      // 499 existing items
      final existing = List.generate(499, (i) => 'old_$i');
      c.read(_testProvider(0).notifier).state =
          AsyncValue.data(_TestState(items: existing, hasMore: true));

      // 10 new items → combined 509 > 500 → trimmed to last 500
      final newPage = List.generate(10, (i) => 'new_$i');
      c.read(_testProvider(0).notifier).setFetchFn(
          (_) async => PageResult(items: newPage, hasMore: false));

      await c.read(_testProvider(0).notifier).loadMore();

      final result = c.read(_testProvider(0)).requireValue;
      expect(result.items.length, 500);
      // Last 500 of the 509 combined: first 9 old items are trimmed
      expect(result.items.first, 'old_9');
      expect(result.items.last, 'new_9');
    });

    test('handles generic errors gracefully (resets isLoadingMore)', () async {
      final c = _container();
      addTearDown(c.dispose);

      await _resolve(c);

      c.read(_testProvider(0).notifier).state =
          AsyncValue.data(const _TestState(hasMore: true));

      c.read(_testProvider(0).notifier).setFetchFn(
          (_) async => throw Exception('network failure'));

      await c.read(_testProvider(0).notifier).loadMore();

      final result = c.read(_testProvider(0)).requireValue;
      expect(result.isLoadingMore, false);
      expect(result.items, isEmpty);
    });

    test('handles cancelled DioException without changing state to error',
        () async {
      final c = _container();
      addTearDown(c.dispose);

      await _resolve(c);

      c.read(_testProvider(0).notifier).state =
          AsyncValue.data(const _TestState(items: ['x'], hasMore: true));

      c.read(_testProvider(0).notifier).setFetchFn((_) async => throw DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.cancel,
          ));

      await c.read(_testProvider(0).notifier).loadMore();

      // Cancelled requests must not reset isLoadingMore (stays as-is after cancel)
      final result = c.read(_testProvider(0)).requireValue;
      // State is still data (not error)
      expect(c.read(_testProvider(0)).hasValue, true);
    });

    test('non-cancel DioException resets isLoadingMore', () async {
      final c = _container();
      addTearDown(c.dispose);

      await _resolve(c);

      c.read(_testProvider(0).notifier).state =
          AsyncValue.data(const _TestState(hasMore: true));

      c.read(_testProvider(0).notifier).setFetchFn((_) async => throw DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.connectionError,
          ));

      await c.read(_testProvider(0).notifier).loadMore();

      final result = c.read(_testProvider(0)).requireValue;
      expect(result.isLoadingMore, false);
    });
  });
}
