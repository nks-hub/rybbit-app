import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sentry_dio/sentry_dio.dart';

import '../config/app_config.dart';
import 'auth_interceptor.dart';

/// Cookie jar provider - overridden in main.dart with PersistCookieJar.
final cookieJarProvider = Provider<CookieJar>((ref) => CookieJar());

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  final config = ref.watch(appConfigNotifierProvider);
  final interceptor = AuthInterceptor();
  interceptor.apiKey = config.apiKey;
  return interceptor;
});

final dioProvider = Provider<Dio>((ref) {
  final config = ref.watch(appConfigNotifierProvider);
  final authInterceptor = ref.watch(authInterceptorProvider);
  final cookieJar = ref.watch(cookieJarProvider);

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

  dio.addSentry(captureFailedRequests: false);

  return dio;
});
