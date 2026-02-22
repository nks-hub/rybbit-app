import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String? _apiKey;

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
}
