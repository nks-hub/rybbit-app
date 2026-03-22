import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rybbit_unofficial/features/auth/data/auth_repository.dart';

class MockDio extends Mock implements Dio {}

Response<T> _mockResponse<T>(T data, {int statusCode = 200}) {
  return Response<T>(
    data: data,
    statusCode: statusCode,
    requestOptions: RequestOptions(path: ''),
  );
}

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

void main() {
  late MockDio mockDio;
  late AuthRepository repo;

  setUp(() {
    mockDio = MockDio();
    repo = AuthRepository(mockDio);
  });

  group('AuthRepository.login', () {
    test('success returns response map', () async {
      final responseData = {
        'user': {'id': '1', 'email': 'a@b.com'},
      };
      when(() => mockDio.post(
            '/api/auth/sign-in/email',
            data: any(named: 'data'),
          )).thenAnswer((_) async => _mockResponse(responseData));

      final result = await repo.login('a@b.com', 'secret');

      expect(result, responseData);
    });

    test('401 propagates DioException', () async {
      when(() => mockDio.post(
            '/api/auth/sign-in/email',
            data: any(named: 'data'),
          )).thenThrow(_dioException(statusCode: 401));

      expect(
        () => repo.login('a@b.com', 'wrong'),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('AuthRepository.getSession', () {
    test('success returns user map', () async {
      final responseData = {'user': {'id': '1', 'email': 'a@b.com'}};
      when(() => mockDio.get('/api/auth/get-session'))
          .thenAnswer((_) async => _mockResponse(responseData));

      final result = await repo.getSession();

      expect(result, responseData);
    });

    test('401 returns null without throwing', () async {
      when(() => mockDio.get('/api/auth/get-session'))
          .thenThrow(_dioException(statusCode: 401));

      final result = await repo.getSession();

      expect(result, isNull);
    });

    test('non-401 DioException is rethrown', () async {
      when(() => mockDio.get('/api/auth/get-session'))
          .thenThrow(_dioException(statusCode: 500));

      expect(
        () => repo.getSession(),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('AuthRepository.verifyApiKey', () {
    test('non-empty list response returns user info map', () async {
      final orgs = [
        {'id': '1', 'name': 'Org'}
      ];
      when(() => mockDio.get('/api/organizations'))
          .thenAnswer((_) async => _mockResponse(orgs));

      final result = await repo.verifyApiKey();

      expect(result, isNotNull);
      expect(result!['name'], 'API Key User');
    });

    test('empty list response returns null', () async {
      when(() => mockDio.get('/api/organizations'))
          .thenAnswer((_) async => _mockResponse(<dynamic>[]));

      final result = await repo.verifyApiKey();

      expect(result, isNull);
    });

    test('non-list response returns null', () async {
      when(() => mockDio.get('/api/organizations'))
          .thenAnswer((_) async => _mockResponse(<String, dynamic>{}));

      final result = await repo.verifyApiKey();

      expect(result, isNull);
    });

    test('401 response returns null without throwing', () async {
      when(() => mockDio.get('/api/organizations'))
          .thenThrow(_dioException(statusCode: 401));

      final result = await repo.verifyApiKey();

      expect(result, isNull);
    });

    test('403 response returns null without throwing', () async {
      when(() => mockDio.get('/api/organizations'))
          .thenThrow(_dioException(statusCode: 403));

      final result = await repo.verifyApiKey();

      expect(result, isNull);
    });

    test('non-401/403 DioException is rethrown', () async {
      when(() => mockDio.get('/api/organizations'))
          .thenThrow(_dioException(statusCode: 500));

      expect(
        () => repo.verifyApiKey(),
        throwsA(isA<DioException>()),
      );
    });
  });

  group('AuthRepository.logout', () {
    test('success completes without error', () async {
      when(() => mockDio.post('/api/auth/sign-out'))
          .thenAnswer((_) async => _mockResponse(null));

      await expectLater(repo.logout(), completes);
    });

    test('failure propagates the exception', () async {
      when(() => mockDio.post('/api/auth/sign-out'))
          .thenThrow(_dioException(statusCode: 500));

      expect(
        () => repo.logout(),
        throwsA(isA<DioException>()),
      );
    });
  });
}
