import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../features/auth/application/auth_controller.dart';

class AuthInterceptor extends Interceptor {
  final Ref? _ref;
  String? _apiKey;

  AuthInterceptor({Ref? ref}) : _ref = ref;

  String? get apiKey => _apiKey;

  set apiKey(String? value) {
    _apiKey = value;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_apiKey != null && _apiKey!.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $_apiKey';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401 && _ref != null) {
      // Skip logout trigger for auth endpoints to avoid loops
      final path = err.requestOptions.path;
      if (!path.contains('/api/auth/')) {
        _ref!.read(authControllerProvider.notifier).logout();
      }
    }
    handler.next(err);
  }
}
