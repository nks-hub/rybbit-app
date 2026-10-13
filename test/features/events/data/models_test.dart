import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/features/events/data/models.dart';

void main() {
  group('EventProperty.fromJson', () {
    test('keeps numeric and boolean values as text', () {
      final number = EventProperty.fromJson(
        {'propertyKey': 'score', 'propertyValue': 42, 'count': 3},
      );
      final flag = EventProperty.fromJson(
        {'property_key': 'correct', 'property_value': true, 'count': 1},
      );

      expect(number.propertyValue, '42');
      expect(number.count, 3);
      expect(flag.propertyKey, 'correct');
      expect(flag.propertyValue, 'true');
    });

    test('falls back to empty strings when fields are missing', () {
      final property = EventProperty.fromJson({});

      expect(property.propertyKey, '');
      expect(property.propertyValue, '');
      expect(property.count, 0);
    });
  });
}
