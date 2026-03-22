import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/core/config/app_config.dart';

void main() {
  group('AppConfig', () {
    group('baseUrl', () {
      test('returns empty string when serverUrl is empty', () {
        const config = AppConfig(serverUrl: '');
        expect(config.baseUrl, '');
      });

      test('strips trailing slash from serverUrl', () {
        const config = AppConfig(serverUrl: 'https://example.com/');
        expect(config.baseUrl, 'https://example.com');
      });

      test('returns serverUrl unchanged when no trailing slash', () {
        const config = AppConfig(serverUrl: 'https://example.com');
        expect(config.baseUrl, 'https://example.com');
      });

      test('strips only the last trailing slash', () {
        const config = AppConfig(serverUrl: 'https://example.com/api/');
        expect(config.baseUrl, 'https://example.com/api');
      });

      test('returns non-empty url without trailing slash as-is', () {
        const config = AppConfig(serverUrl: 'http://localhost:3000');
        expect(config.baseUrl, 'http://localhost:3000');
      });
    });

    group('isConfigured', () {
      test('returns false when serverUrl is empty', () {
        const config = AppConfig();
        expect(config.isConfigured, false);
      });

      test('returns true when serverUrl is set', () {
        const config = AppConfig(serverUrl: 'https://example.com');
        expect(config.isConfigured, true);
      });
    });

    group('hasApiKey', () {
      test('returns false when apiKey is null', () {
        const config = AppConfig(serverUrl: 'https://example.com');
        expect(config.hasApiKey, false);
      });

      test('returns false when apiKey is empty string', () {
        const config = AppConfig(serverUrl: 'https://example.com', apiKey: '');
        expect(config.hasApiKey, false);
      });

      test('returns true when apiKey is set', () {
        const config = AppConfig(
          serverUrl: 'https://example.com',
          apiKey: 'secret-key',
        );
        expect(config.hasApiKey, true);
      });
    });

    group('copyWith', () {
      test('preserves existing values when not overridden', () {
        const config = AppConfig(
          serverUrl: 'https://example.com',
          apiKey: 'key',
        );
        final copy = config.copyWith();
        expect(copy.serverUrl, 'https://example.com');
        expect(copy.apiKey, 'key');
      });

      test('overrides serverUrl', () {
        const config = AppConfig(serverUrl: 'https://old.com');
        final copy = config.copyWith(serverUrl: 'https://new.com');
        expect(copy.serverUrl, 'https://new.com');
      });
    });
  });

  group('AppConfigNotifier', () {
    test('initial state has empty serverUrl and null apiKey', () {
      // Build is called by the Riverpod framework; test via AppConfig directly
      const config = AppConfig();
      expect(config.serverUrl, '');
      expect(config.apiKey, null);
      expect(config.isConfigured, false);
    });
  });
}
