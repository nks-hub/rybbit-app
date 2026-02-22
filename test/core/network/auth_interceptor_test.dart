import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/core/network/auth_interceptor.dart';

void main() {
  group('AuthInterceptor', () {
    late AuthInterceptor interceptor;

    setUp(() {
      interceptor = AuthInterceptor();
    });

    test('should not add Authorization header when apiKey is null', () {
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(
        options,
        RequestInterceptorHandler(),
      );

      expect(options.headers.containsKey('Authorization'), false);
    });

    test('should not add Authorization header when apiKey is empty', () {
      interceptor.apiKey = '';
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(
        options,
        RequestInterceptorHandler(),
      );

      expect(options.headers.containsKey('Authorization'), false);
    });

    test('should add Bearer token when apiKey is set', () {
      interceptor.apiKey = 'test-api-key-123';
      final options = RequestOptions(path: '/test');

      interceptor.onRequest(
        options,
        RequestInterceptorHandler(),
      );

      expect(options.headers['Authorization'], 'Bearer test-api-key-123');
    });

    test('should update Authorization header when apiKey changes', () {
      interceptor.apiKey = 'key-1';
      final options1 = RequestOptions(path: '/test');
      interceptor.onRequest(options1, RequestInterceptorHandler());
      expect(options1.headers['Authorization'], 'Bearer key-1');

      interceptor.apiKey = 'key-2';
      final options2 = RequestOptions(path: '/test');
      interceptor.onRequest(options2, RequestInterceptorHandler());
      expect(options2.headers['Authorization'], 'Bearer key-2');
    });

    test('should remove Authorization header when apiKey is cleared', () {
      interceptor.apiKey = 'test-key';
      interceptor.apiKey = null;

      final options = RequestOptions(path: '/test');
      interceptor.onRequest(options, RequestInterceptorHandler());

      expect(options.headers.containsKey('Authorization'), false);
    });
  });
}
