import 'dart:convert';

import 'package:riverpod/riverpod.dart';

import '../../shared/models/filter.dart';

class FilterController extends Notifier<List<Filter>> {
  @override
  List<Filter> build() => [];

  void addFilter(Filter filter) {
    state = [...state, filter];
  }

  void removeFilter(int index) {
    final updated = [...state];
    if (index >= 0 && index < updated.length) {
      updated.removeAt(index);
    }
    state = updated;
  }

  void clearFilters() {
    state = [];
  }

  /// Converts active filters to a JSON string for API params.
  String filtersToJson() {
    if (state.isEmpty) return '[]';
    return jsonEncode(state.map((f) => f.toJson()).toList());
  }

  /// Returns filters as query parameters map.
  Map<String, String> toQueryParams() {
    if (state.isEmpty) return {};
    return {'filters': filtersToJson()};
  }
}

final filterControllerProvider =
    NotifierProvider<FilterController, List<Filter>>(FilterController.new);
