import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rybbit_unofficial/core/storage/storage_service.dart';
import 'package:rybbit_unofficial/features/auth/application/auth_controller.dart';
import 'package:rybbit_unofficial/features/auth/data/auth_repository.dart';

import '../../../mocks/mock_storage_service.dart';

// ---------------------------------------------------------------------------
// Mocks
// ---------------------------------------------------------------------------

class MockAuthRepository extends Mock implements AuthRepository {}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

DioException _dioException({int? statusCode, dynamic responseData}) {
  return DioException(
    requestOptions: RequestOptions(path: ''),
    response: statusCode != null
        ? Response(
            data: responseData,
            statusCode: statusCode,
            requestOptions: RequestOptions(path: ''),
          )
        : null,
    type: statusCode != null
        ? DioExceptionType.badResponse
        : DioExceptionType.connectionError,
  );
}

/// Creates a [ProviderContainer] with [authRepositoryProvider] and
/// [storageServiceProvider] overridden so no platform channels are needed.
ProviderContainer _makeContainer(
  AuthRepository mockRepo,
  StorageService mockStorage,
) {
  return ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(mockRepo),
      storageServiceProvider.overrideWithValue(mockStorage),
    ],
  );
}

void main() {
  late MockAuthRepository mockRepo;
  late MockStorageService mockStorage;
  late ProviderContainer container;

  setUp(() {
    mockRepo = MockAuthRepository();
    mockStorage = MockStorageService();

    // Default stubs for secure storage writes/deletes (no-ops unless overridden)
    when(() => mockStorage.saveSecure(any(), any())).thenAnswer((_) async {});
    when(() => mockStorage.deleteSecure(any())).thenAnswer((_) async {});
    when(() => mockStorage.readSecure(any())).thenAnswer((_) async => null);
    when(() => mockStorage.saveSetting(any(), any())).thenAnswer((_) async {});
    when(() => mockStorage.deleteSetting(any())).thenAnswer((_) async {});
    when(() => mockStorage.readSetting(any(), defaultValue: any(named: 'defaultValue')))
        .thenReturn(null);
  });

  tearDown(() {
    container.dispose();
  });

  group('AuthController initial state', () {
    test('status is unknown and isLoading is false', () {
      container = _makeContainer(mockRepo, mockStorage);
      final state = container.read(authControllerProvider);

      expect(state.status, AuthStatus.unknown);
      expect(state.isLoading, false);
      expect(state.error, isNull);
      expect(state.user, isNull);
    });
  });

  group('AuthController.login', () {
    test('DioException with response message → unauthenticated with message',
        () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.login(any(), any())).thenThrow(
        _dioException(
          statusCode: 401,
          responseData: {'message': 'Invalid credentials'},
        ),
      );

      await container
          .read(authControllerProvider.notifier)
          .login('https://example.com', 'a@b.com', 'wrong');

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
      expect(state.isLoading, false);
      expect(state.error, 'Invalid credentials');
    });

    test('DioException without response → connectionFailedError', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.login(any(), any())).thenThrow(_dioException());

      await container
          .read(authControllerProvider.notifier)
          .login('https://example.com', 'a@b.com', 'pw');

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
      expect(state.isLoading, false);
      expect(state.error, AuthController.connectionFailedError);
    });

    test('DioException with error field (no message) → uses error field',
        () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.login(any(), any())).thenThrow(
        _dioException(
          statusCode: 400,
          responseData: {'error': 'Bad request'},
        ),
      );

      await container
          .read(authControllerProvider.notifier)
          .login('https://example.com', 'a@b.com', 'pw');

      final state = container.read(authControllerProvider);
      expect(state.error, 'Bad request');
    });

    test('success → authenticated with user and storage writes called',
        () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.login(any(), any())).thenAnswer(
        (_) async => {'user': <String, dynamic>{'id': '1', 'email': 'a@b.com'}},
      );

      await container
          .read(authControllerProvider.notifier)
          .login('https://example.com', 'a@b.com', 'pw');

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.authenticated);
      expect(state.isLoading, false);
      expect(state.user?.email, 'a@b.com');

      verify(() => mockStorage.saveSecure('server_url', 'https://example.com')).called(1);
      verify(() => mockStorage.saveSecure('last_email', 'a@b.com')).called(1);
      verify(() => mockStorage.deleteSecure('api_key')).called(1);
    });

    test('isLoading is set to true during login', () async {
      container = _makeContainer(mockRepo, mockStorage);
      final states = <AuthState>[];

      container.listen(authControllerProvider, (_, next) => states.add(next));

      when(() => mockRepo.login(any(), any())).thenThrow(_dioException());

      await container
          .read(authControllerProvider.notifier)
          .login('https://example.com', 'a@b.com', 'pw');

      expect(states.first.isLoading, true);
      expect(states.last.isLoading, false);
    });
  });

  group('AuthController.loginWithApiKey', () {
    test('null from verifyApiKey → invalidApiKeyError', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.verifyApiKey()).thenAnswer((_) async => null);

      await container
          .read(authControllerProvider.notifier)
          .loginWithApiKey('https://example.com', 'bad-key');

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
      expect(state.isLoading, false);
      expect(state.error, AuthController.invalidApiKeyError);
    });

    test('DioException without response → connectionFailedApiKeyError',
        () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.verifyApiKey()).thenThrow(_dioException());

      await container
          .read(authControllerProvider.notifier)
          .loginWithApiKey('https://example.com', 'key');

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
      expect(state.isLoading, false);
      expect(state.error, AuthController.connectionFailedApiKeyError);
    });

    test('DioException with message → uses that message', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.verifyApiKey()).thenThrow(
        _dioException(
          statusCode: 403,
          responseData: {'message': 'Forbidden'},
        ),
      );

      await container
          .read(authControllerProvider.notifier)
          .loginWithApiKey('https://example.com', 'key');

      final state = container.read(authControllerProvider);
      expect(state.error, 'Forbidden');
    });

    test('valid key → authenticated with user and storage writes called',
        () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.verifyApiKey()).thenAnswer(
        (_) async => {'name': 'API Key User', 'role': 'user'},
      );

      await container
          .read(authControllerProvider.notifier)
          .loginWithApiKey('https://example.com', 'valid-key');

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.authenticated);
      expect(state.isLoading, false);
      expect(state.user?.name, 'API Key User');

      verify(() => mockStorage.saveSecure('server_url', 'https://example.com')).called(1);
      verify(() => mockStorage.saveSecure('api_key', 'valid-key')).called(1);
    });

    test('isLoading transitions during loginWithApiKey', () async {
      container = _makeContainer(mockRepo, mockStorage);
      final states = <AuthState>[];

      container.listen(authControllerProvider, (_, next) => states.add(next));

      when(() => mockRepo.verifyApiKey()).thenAnswer((_) async => null);

      await container
          .read(authControllerProvider.notifier)
          .loginWithApiKey('https://example.com', 'bad-key');

      expect(states.first.isLoading, true);
      expect(states.last.isLoading, false);
    });
  });

  group('AuthController.checkSession', () {
    test('no server_url stored → unauthenticated', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockStorage.readSecure('server_url')).thenAnswer((_) async => null);
      when(() => mockStorage.readSecure('api_key')).thenAnswer((_) async => null);

      await container.read(authControllerProvider.notifier).checkSession();

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
    });

    test('empty server_url → unauthenticated', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockStorage.readSecure('server_url')).thenAnswer((_) async => '');
      when(() => mockStorage.readSecure('api_key')).thenAnswer((_) async => null);

      await container.read(authControllerProvider.notifier).checkSession();

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
    });

    test('valid server_url with valid session cookie → authenticated', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockStorage.readSecure('server_url'))
          .thenAnswer((_) async => 'https://example.com');
      when(() => mockStorage.readSecure('api_key')).thenAnswer((_) async => null);
      when(() => mockRepo.getSession()).thenAnswer(
        (_) async => {'user': <String, dynamic>{'id': '1', 'email': 'a@b.com'}},
      );

      await container.read(authControllerProvider.notifier).checkSession();

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.authenticated);
      expect(state.user?.email, 'a@b.com');
    });

    test('valid server_url with valid api_key → authenticated', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockStorage.readSecure('server_url'))
          .thenAnswer((_) async => 'https://example.com');
      when(() => mockStorage.readSecure('api_key'))
          .thenAnswer((_) async => 'my-api-key');
      when(() => mockRepo.verifyApiKey())
          .thenAnswer((_) async => {'name': 'API User'});

      await container.read(authControllerProvider.notifier).checkSession();

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.authenticated);
    });

    test('valid server_url but expired session → unauthenticated', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockStorage.readSecure('server_url'))
          .thenAnswer((_) async => 'https://example.com');
      when(() => mockStorage.readSecure('api_key')).thenAnswer((_) async => null);
      when(() => mockRepo.getSession()).thenAnswer((_) async => null);

      await container.read(authControllerProvider.notifier).checkSession();

      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
    });
  });

  group('AuthController.logout', () {
    test('logout clears api_key and sets unauthenticated', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.logout()).thenAnswer((_) async {});

      await container.read(authControllerProvider.notifier).logout();

      verify(() => mockStorage.deleteSecure('api_key')).called(1);
      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
    });

    test('logout proceeds even when API call throws', () async {
      container = _makeContainer(mockRepo, mockStorage);

      when(() => mockRepo.logout()).thenThrow(Exception('network error'));

      await container.read(authControllerProvider.notifier).logout();

      verify(() => mockStorage.deleteSecure('api_key')).called(1);
      final state = container.read(authControllerProvider);
      expect(state.status, AuthStatus.unauthenticated);
    });
  });
}
