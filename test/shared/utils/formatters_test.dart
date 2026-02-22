import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/shared/utils/formatters.dart';

void main() {
  group('formatNumber', () {
    test('should format small numbers as-is', () {
      expect(formatNumber(0), '0');
      expect(formatNumber(1), '1');
      expect(formatNumber(42), '42');
      expect(formatNumber(999), '999');
    });

    test('should format thousands with K suffix', () {
      expect(formatNumber(1000), '1K');
      expect(formatNumber(1500), '1.5K');
      expect(formatNumber(2300), '2.3K');
      expect(formatNumber(10000), '10K');
      expect(formatNumber(999999), '1000.0K');
    });

    test('should format millions with M suffix', () {
      expect(formatNumber(1000000), '1M');
      expect(formatNumber(1500000), '1.5M');
      expect(formatNumber(2300000), '2.3M');
      expect(formatNumber(10000000), '10M');
    });

    test('should handle double values', () {
      expect(formatNumber(42.7), '43');
      expect(formatNumber(0.5), '1');
    });
  });

  group('formatDuration', () {
    test('should format zero seconds', () {
      expect(formatDuration(0), '0s');
    });

    test('should format seconds only', () {
      expect(formatDuration(1), '1s');
      expect(formatDuration(30), '30s');
      expect(formatDuration(59), '59s');
    });

    test('should format minutes and seconds', () {
      expect(formatDuration(60), '1m');
      expect(formatDuration(61), '1m 1s');
      expect(formatDuration(90), '1m 30s');
      expect(formatDuration(125), '2m 5s');
    });

    test('should format exact minutes without seconds', () {
      expect(formatDuration(120), '2m');
      expect(formatDuration(300), '5m');
    });

    test('should handle negative values', () {
      expect(formatDuration(-5), '0s');
    });

    test('should handle decimal seconds', () {
      expect(formatDuration(30.7), '31s');
      expect(formatDuration(90.4), '1m 30s');
    });
  });

  group('formatPercentage', () {
    test('should format percentage with one decimal', () {
      expect(formatPercentage(0), '0.0%');
      expect(formatPercentage(50), '50.0%');
      expect(formatPercentage(100), '100.0%');
    });

    test('should format decimal percentages', () {
      expect(formatPercentage(33.33), '33.3%');
      expect(formatPercentage(66.67), '66.7%');
      expect(formatPercentage(99.99), '100.0%');
    });

    test('should handle small percentages', () {
      expect(formatPercentage(0.1), '0.1%');
      expect(formatPercentage(0.05), '0.1%');
    });
  });
}
