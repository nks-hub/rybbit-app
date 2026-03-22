import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rybbit_unofficial/core/state/filter_controller.dart';
import 'package:rybbit_unofficial/shared/models/filter.dart';

void main() {
  group('FilterController', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is empty list', () {
      final state = container.read(filterControllerProvider);
      expect(state, isEmpty);
    });

    test('addFilter appends filter to state', () {
      final notifier = container.read(filterControllerProvider.notifier);
      const filter = Filter(
        parameter: FilterParameter.browser,
        type: FilterType.equals,
        value: ['Chrome'],
      );
      notifier.addFilter(filter);
      expect(container.read(filterControllerProvider), [filter]);
    });

    test('addFilter appends multiple filters in order', () {
      final notifier = container.read(filterControllerProvider.notifier);
      const f1 = Filter(
        parameter: FilterParameter.browser,
        type: FilterType.equals,
        value: ['Chrome'],
      );
      const f2 = Filter(
        parameter: FilterParameter.country,
        type: FilterType.notEquals,
        value: ['US'],
      );
      notifier.addFilter(f1);
      notifier.addFilter(f2);
      final state = container.read(filterControllerProvider);
      expect(state.length, 2);
      expect(state[0], f1);
      expect(state[1], f2);
    });

    test('removeFilter removes filter at given index', () {
      final notifier = container.read(filterControllerProvider.notifier);
      const f1 = Filter(
        parameter: FilterParameter.browser,
        type: FilterType.equals,
        value: ['Chrome'],
      );
      const f2 = Filter(
        parameter: FilterParameter.country,
        type: FilterType.notEquals,
        value: ['US'],
      );
      notifier.addFilter(f1);
      notifier.addFilter(f2);
      notifier.removeFilter(0);
      final state = container.read(filterControllerProvider);
      expect(state.length, 1);
      expect(state[0], f2);
    });

    test('removeFilter with out-of-bounds index does not throw', () {
      final notifier = container.read(filterControllerProvider.notifier);
      const f = Filter(
        parameter: FilterParameter.browser,
        type: FilterType.equals,
        value: ['Chrome'],
      );
      notifier.addFilter(f);
      expect(() => notifier.removeFilter(5), returnsNormally);
      expect(container.read(filterControllerProvider).length, 1);
    });

    test('removeFilter with negative index does not throw', () {
      final notifier = container.read(filterControllerProvider.notifier);
      expect(() => notifier.removeFilter(-1), returnsNormally);
      expect(container.read(filterControllerProvider), isEmpty);
    });

    test('clearFilters empties the state', () {
      final notifier = container.read(filterControllerProvider.notifier);
      notifier.addFilter(const Filter(
        parameter: FilterParameter.browser,
        type: FilterType.equals,
        value: ['Chrome'],
      ));
      notifier.addFilter(const Filter(
        parameter: FilterParameter.country,
        type: FilterType.equals,
        value: ['US'],
      ));
      notifier.clearFilters();
      expect(container.read(filterControllerProvider), isEmpty);
    });

    group('filtersToJson', () {
      test('returns "[]" when state is empty', () {
        final notifier = container.read(filterControllerProvider.notifier);
        expect(notifier.filtersToJson(), '[]');
      });

      test('serializes single filter correctly', () {
        final notifier = container.read(filterControllerProvider.notifier);
        notifier.addFilter(const Filter(
          parameter: FilterParameter.browser,
          type: FilterType.equals,
          value: ['Firefox'],
        ));
        final json = notifier.filtersToJson();
        final decoded = jsonDecode(json) as List;
        expect(decoded.length, 1);
        expect(decoded[0]['parameter'], 'browser');
        expect(decoded[0]['type'], 'equals');
        expect(decoded[0]['value'], ['Firefox']);
      });

      test('serializes multiple filters correctly', () {
        final notifier = container.read(filterControllerProvider.notifier);
        notifier.addFilter(const Filter(
          parameter: FilterParameter.browser,
          type: FilterType.equals,
          value: ['Chrome'],
        ));
        notifier.addFilter(const Filter(
          parameter: FilterParameter.country,
          type: FilterType.notEquals,
          value: ['US', 'UK'],
        ));
        final json = notifier.filtersToJson();
        final decoded = jsonDecode(json) as List;
        expect(decoded.length, 2);
        expect(decoded[0]['parameter'], 'browser');
        expect(decoded[1]['parameter'], 'country');
        expect(decoded[1]['value'], ['US', 'UK']);
      });
    });

    group('toQueryParams', () {
      test('returns empty map when state is empty', () {
        final notifier = container.read(filterControllerProvider.notifier);
        expect(notifier.toQueryParams(), isEmpty);
      });

      test('returns filters key when single filter present', () {
        final notifier = container.read(filterControllerProvider.notifier);
        notifier.addFilter(const Filter(
          parameter: FilterParameter.operatingSystem,
          type: FilterType.contains,
          value: ['Windows'],
        ));
        final params = notifier.toQueryParams();
        expect(params.containsKey('filters'), true);
        final decoded = jsonDecode(params['filters']!) as List;
        expect(decoded.length, 1);
        expect(decoded[0]['parameter'], 'operating_system');
      });

      test('returns filters key with multiple filters encoded', () {
        final notifier = container.read(filterControllerProvider.notifier);
        notifier.addFilter(const Filter(
          parameter: FilterParameter.browser,
          type: FilterType.equals,
          value: ['Safari'],
        ));
        notifier.addFilter(const Filter(
          parameter: FilterParameter.deviceType,
          type: FilterType.equals,
          value: ['mobile'],
        ));
        final params = notifier.toQueryParams();
        final decoded = jsonDecode(params['filters']!) as List;
        expect(decoded.length, 2);
      });
    });
  });
}
