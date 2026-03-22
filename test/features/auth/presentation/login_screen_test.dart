import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rybbit_unofficial/core/config/app_config.dart';
import 'package:rybbit_unofficial/core/storage/storage_service.dart';
import 'package:rybbit_unofficial/features/auth/application/auth_controller.dart';
import 'package:rybbit_unofficial/features/auth/presentation/login_screen.dart';
import 'package:rybbit_unofficial/l10n/app_localizations.dart';

import '../../../mocks/mock_storage_service.dart';

// ---------------------------------------------------------------------------
// Mock notifiers
// ---------------------------------------------------------------------------

class _FakeAuthNotifier extends AuthController {
  final AuthState _initial;

  _FakeAuthNotifier(this._initial);

  @override
  AuthState build() => _initial;

  @override
  Future<void> login(String serverUrl, String email, String password) async {}

  @override
  Future<void> loginWithApiKey(String serverUrl, String apiKey) async {}
}

class _FakeAppConfigNotifier extends AppConfigNotifier {
  @override
  AppConfig build() => const AppConfig();
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

MockStorageService _makeStorage({
  String? savedUrl,
  String? savedEmail,
}) {
  final mock = MockStorageService();

  // Register catch-all FIRST so specific matchers registered after take priority
  when(() => mock.readSecure(any())).thenAnswer((_) async => null);

  // Specific key overrides (registered last → highest priority in mocktail)
  when(() => mock.readSecure('server_url')).thenAnswer((_) async => savedUrl);
  when(() => mock.readSecure('last_email')).thenAnswer((_) async => savedEmail);

  when(() => mock.saveSecure(any(), any())).thenAnswer((_) async {});
  when(() => mock.deleteSecure(any())).thenAnswer((_) async {});
  when(() => mock.readSetting(
        any(),
        defaultValue: any(named: 'defaultValue'),
      )).thenReturn(null);

  return mock;
}

Widget _buildWidget({
  AuthState initialAuthState = const AuthState(),
  String? savedUrl,
  String? savedEmail,
}) {
  final mockStorage = _makeStorage(savedUrl: savedUrl, savedEmail: savedEmail);

  return ProviderScope(
    overrides: [
      authControllerProvider
          .overrideWith(() => _FakeAuthNotifier(initialAuthState)),
      storageServiceProvider.overrideWithValue(mockStorage),
      appConfigNotifierProvider.overrideWith(() => _FakeAppConfigNotifier()),
    ],
    child: const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en'),
      home: LoginScreen(),
    ),
  );
}

// Pumps widget then lets async initState work finish
Future<void> _pump(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(widget);
  // Allow _loadSavedCredentials future to complete
  await tester.pump();
  await tester.pump();
}

// ---------------------------------------------------------------------------
// Tests
// ---------------------------------------------------------------------------

void main() {
  group('LoginScreen – URL validation', () {
    testWidgets('empty URL shows validation error', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      // Validator returns l10n.serverUrl = 'Server URL' as error text
      expect(find.text('Server URL'), findsWidgets);
    });

    testWidgets('URL without scheme shows invalidUrl error', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.enterText(find.byType(TextFormField).first, 'example.com');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid URL (https://...)'), findsOneWidget);
    });

    testWidgets('URL with ftp:// scheme shows invalidUrl error', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'ftp://example.com');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid URL (https://...)'), findsOneWidget);
    });

    testWidgets('URL with http:// passes URL validation', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'http://example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'a@b.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid URL (https://...)'), findsNothing);
    });

    testWidgets('URL with https:// passes URL validation', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'https://example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'a@b.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid URL (https://...)'), findsNothing);
    });

    testWidgets('URL with trailing slash is accepted', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'https://example.com/');
      await tester.enterText(find.byType(TextFormField).at(1), 'a@b.com');
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      expect(find.text('Enter a valid URL (https://...)'), findsNothing);
    });
  });

  group('LoginScreen – email/password validation', () {
    testWidgets('empty email shows validation error', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'https://example.com');
      // Leave email empty at index 1, fill password at index 2
      await tester.enterText(find.byType(TextFormField).at(2), 'password');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      // Validator returns l10n.email = 'Email' as error text
      expect(find.text('Email'), findsWidgets);
    });

    testWidgets('empty password shows validation error', (tester) async {
      await _pump(tester, _buildWidget());

      await tester.enterText(
          find.byType(TextFormField).first, 'https://example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'a@b.com');
      // Leave password empty
      await tester.tap(find.widgetWithText(ElevatedButton, 'Connect'));
      await tester.pumpAndSettle();

      // Validator returns l10n.password = 'Password' as error text
      expect(find.text('Password'), findsWidgets);
    });
  });

  group('LoginScreen – mode toggle', () {
    testWidgets('default mode shows 3 fields (url + email + password)',
        (tester) async {
      await _pump(tester, _buildWidget());

      expect(find.byType(TextFormField), findsNWidgets(3));
    });

    testWidgets('tapping API Key segment shows 2 fields (url + api key)',
        (tester) async {
      await _pump(tester, _buildWidget());

      await tester.tap(find.text('API Key'));
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsNWidgets(2));
    });

    testWidgets(
        'tapping API Key then Email segment restores 3 fields',
        (tester) async {
      await _pump(tester, _buildWidget());

      await tester.tap(find.text('API Key'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Email'));
      await tester.pumpAndSettle();

      expect(find.byType(TextFormField), findsNWidgets(3));
    });
  });

  group('LoginScreen – error display', () {
    testWidgets('connectionFailedError shows localized message', (tester) async {
      await _pump(
        tester,
        _buildWidget(
          initialAuthState: const AuthState(
            error: AuthController.connectionFailedError,
          ),
        ),
      );

      expect(
        find.text('Connection failed. Check server URL.'),
        findsOneWidget,
      );
    });

    testWidgets('invalidApiKeyError shows localized message', (tester) async {
      await _pump(
        tester,
        _buildWidget(
          initialAuthState: const AuthState(
            error: AuthController.invalidApiKeyError,
          ),
        ),
      );

      expect(find.text('Invalid API key'), findsOneWidget);
    });

    testWidgets('unexpectedError shows localized message', (tester) async {
      await _pump(
        tester,
        _buildWidget(
          initialAuthState: const AuthState(
            error: AuthController.unexpectedError,
          ),
        ),
      );

      expect(
        find.text('An unexpected error occurred. Please try again.'),
        findsOneWidget,
      );
    });

    testWidgets('unknown error code falls back to unexpectedError message',
        (tester) async {
      await _pump(
        tester,
        _buildWidget(
          initialAuthState: const AuthState(error: 'err:unknown_xyz'),
        ),
      );

      expect(
        find.text('An unexpected error occurred. Please try again.'),
        findsOneWidget,
      );
    });

    testWidgets('no error — error container is absent', (tester) async {
      await _pump(tester, _buildWidget());

      expect(find.text('Connection failed. Check server URL.'), findsNothing);
      expect(
        find.text('An unexpected error occurred. Please try again.'),
        findsNothing,
      );
    });
  });

  group('LoginScreen – loading state', () {
    testWidgets('when isLoading, button shows spinner and is disabled',
        (tester) async {
      await tester.pumpWidget(_buildWidget(
        initialAuthState: const AuthState(isLoading: true),
      ));
      // Use pump with a duration to advance frames without waiting for
      // the CircularProgressIndicator animation to settle (it never will).
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(button.onPressed, isNull);
    });

    testWidgets('when not loading, button shows Connect text and is enabled',
        (tester) async {
      await _pump(tester, _buildWidget());

      expect(find.text('Connect'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);

      final button = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      expect(button.onPressed, isNotNull);
    });
  });

  group('LoginScreen – saved credentials pre-fill', () {
    testWidgets('saved server URL is pre-filled after init', (tester) async {
      await _pump(tester, _buildWidget(savedUrl: 'https://saved.example.com'));

      // The first EditableText belongs to the server URL TextFormField
      final editableTexts = tester.widgetList<EditableText>(
        find.byType(EditableText),
      );
      final urlValue = editableTexts.first.controller.text;
      expect(urlValue, 'https://saved.example.com');
    });

    testWidgets('saved email is pre-filled after init', (tester) async {
      await _pump(
        tester,
        _buildWidget(
          savedUrl: 'https://saved.example.com',
          savedEmail: 'saved@example.com',
        ),
      );

      final editableTexts = tester.widgetList<EditableText>(
        find.byType(EditableText),
      ).toList();

      // index 0 = server url, index 1 = email, index 2 = password (obscured)
      expect(editableTexts[1].controller.text, 'saved@example.com');
    });
  });
}
