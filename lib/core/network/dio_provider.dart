import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:riverpod/riverpod.dart';

import '../config/app_config.dart';
import 'auth_interceptor.dart';

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  final config = ref.watch(appConfigNotifierProvider);
  final interceptor = AuthInterceptor();
  interceptor.apiKey = config.apiKey;
  return interceptor;
});

final dioProvider = Provider<Dio>((ref) {
  final config = ref.watch(appConfigNotifierProvider);
  final authInterceptor = ref.watch(authInterceptorProvider);
  final cookieJar = CookieJar();

  final dio = Dio(
    BaseOptions(
      baseUrl: config.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    CookieManager(cookieJar),
    authInterceptor,
  ]);

  return dio;
});
