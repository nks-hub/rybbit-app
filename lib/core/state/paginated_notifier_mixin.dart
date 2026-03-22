import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

/// Mixin for [AutoDisposeFamilyAsyncNotifier] subclasses that implement
/// paginated list loading with a [loadMore] method.
///
/// Type parameters:
///   [S] – the full notifier state (e.g. SessionsState)
///   [T] – the individual list item type (e.g. AnalyticsSession)
///
/// The concrete notifier must implement four abstract members:
///   - [getItems]          extract the current item list from [S]
///   - [getPaginationInfo] extract [PaginationInfo] flags from [S]
///   - [setLoadingMore]    return a copy of [S] with isLoadingMore toggled
///   - [fetchNextPage]     perform the network call and return [PageResult<T>]
mixin PaginatedNotifierMixin<S, T, Arg>
    on AutoDisposeFamilyAsyncNotifier<S, Arg> {
  /// Maximum number of items kept in memory across pages.
  int get maxItems => 500;

  /// Returns the list of already-loaded items from [currentState].
  List<T> getItems(S currentState);

  /// Returns pagination flags extracted from [currentState].
  PaginationInfo getPaginationInfo(S currentState);

  /// Returns a copy of [currentState] with [isLoadingMore] set to [value].
  S setLoadingMore(S currentState, {required bool value});

  /// Builds the next state by merging [trimmedItems] (already capped to
  /// [maxItems]) with metadata from [result].
  S buildNextState(S currentState, List<T> trimmedItems, PageResult<T> result);

  /// Fetches the next page.  The concrete notifier supplies all parameters
  /// (page number, cursor, offset, etc.) based on [currentState].
  Future<PageResult<T>> fetchNextPage(S currentState);

  /// Loads the next page and appends results to the existing list.
  ///
  /// Safe to call multiple times; subsequent calls while loading or when there
  /// is no more data are silently ignored.
  Future<void> loadMore() async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    final info = getPaginationInfo(currentState);
    if (!info.hasMore || info.isLoadingMore) return;

    state = AsyncValue.data(setLoadingMore(currentState, value: true));

    try {
      final result = await fetchNextPage(currentState);

      final combined = [...getItems(currentState), ...result.items];
      final trimmed = combined.length > maxItems
          ? combined.sublist(combined.length - maxItems)
          : combined;

      state = AsyncValue.data(buildNextState(currentState, trimmed, result));
    } on DioException catch (e) {
      if (e.type != DioExceptionType.cancel) {
        debugPrint('$runtimeType loadMore failed: $e');
        state = AsyncValue.data(setLoadingMore(currentState, value: false));
      }
    } catch (e) {
      debugPrint('$runtimeType loadMore failed: $e');
      state = AsyncValue.data(setLoadingMore(currentState, value: false));
    }
  }
}

/// Pagination flags extracted from any paginated state object.
class PaginationInfo {
  final bool hasMore;
  final bool isLoadingMore;

  const PaginationInfo({
    required this.hasMore,
    required this.isLoadingMore,
  });
}

/// Result returned by [PaginatedNotifierMixin.fetchNextPage].
///
/// [items] – the new page of items fetched from the API.
/// [hasMore] – whether further pages exist.
/// Any additional fields (totalCount, cursor, currentPage, etc.) should be
/// carried in a subclass or accessed via the closure in [fetchNextPage].
class PageResult<T> {
  final List<T> items;
  final bool hasMore;

  const PageResult({required this.items, required this.hasMore});
}
