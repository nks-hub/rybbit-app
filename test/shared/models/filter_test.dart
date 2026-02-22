import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/shared/models/filter.dart';

void main() {
  group('FilterType', () {
    test('should serialize enum values correctly', () {
      expect(FilterType.equals.value, 'equals');
      expect(FilterType.notEquals.value, 'not_equals');
      expect(FilterType.contains.value, 'contains');
      expect(FilterType.notContains.value, 'not_contains');
      expect(FilterType.regex.value, 'regex');
      expect(FilterType.notRegex.value, 'not_regex');
      expect(FilterType.greaterThan.value, 'greater_than');
      expect(FilterType.lessThan.value, 'less_than');
    });
  });

  group('FilterParameter', () {
    test('should serialize enum values correctly', () {
      expect(FilterParameter.browser.value, 'browser');
      expect(FilterParameter.operatingSystem.value, 'operating_system');
      expect(FilterParameter.deviceType.value, 'device_type');
      expect(FilterParameter.utmSource.value, 'utm_source');
      expect(FilterParameter.entryPage.value, 'entry_page');
      expect(FilterParameter.exitPage.value, 'exit_page');
      expect(FilterParameter.pageTitle.value, 'page_title');
    });
  });

  group('Filter', () {
    test('should serialize to JSON', () {
      const filter = Filter(
        parameter: FilterParameter.browser,
        type: FilterType.equals,
        value: ['Chrome', 'Firefox'],
      );

      final json = filter.toJson();
      expect(json['parameter'], 'browser');
      expect(json['type'], 'equals');
      expect(json['value'], ['Chrome', 'Firefox']);
    });

    test('should deserialize from JSON', () {
      final json = {
        'parameter': 'operating_system',
        'type': 'not_equals',
        'value': ['Windows'],
      };

      final filter = Filter.fromJson(json);
      expect(filter.parameter, FilterParameter.operatingSystem);
      expect(filter.type, FilterType.notEquals);
      expect(filter.value, ['Windows']);
    });

    test('should roundtrip through JSON', () {
      const original = Filter(
        parameter: FilterParameter.country,
        type: FilterType.contains,
        value: ['US', 'UK', 'DE'],
      );

      final json = jsonDecode(jsonEncode(original.toJson()));
      final restored = Filter.fromJson(json as Map<String, dynamic>);

      expect(restored, original);
    });

    test('should handle empty value list', () {
      const filter = Filter(
        parameter: FilterParameter.hostname,
        type: FilterType.equals,
        value: [],
      );

      final json = filter.toJson();
      final restored = Filter.fromJson(json);

      expect(restored.value, isEmpty);
    });

    test('should create with copyWith', () {
      const filter = Filter(
        parameter: FilterParameter.browser,
        type: FilterType.equals,
        value: ['Chrome'],
      );

      final modified = filter.copyWith(
        type: FilterType.notEquals,
        value: ['Safari'],
      );

      expect(modified.parameter, FilterParameter.browser);
      expect(modified.type, FilterType.notEquals);
      expect(modified.value, ['Safari']);
    });
  });
}
