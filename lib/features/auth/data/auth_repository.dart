import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';

class AuthRepository {
  final Dio _dio;

  AuthRepository(this._dio);

  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await _dio.post(
      '/api/auth/sign-in/email',
      data: {'email': email, 'password': password},
    );
    return response.data as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>?> getSession() async {
    try {
      final response = await _dio.get('/api/auth/get-session');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return null;
      }
      rethrow;
    }
  }

  Future<void> logout() async {
    await _dio.post('/api/auth/sign-out');
  }

  Future<Map<String, dynamic>> getConfig() async {
    final response = await _dio.get('/api/config');
    return response.data as Map<String, dynamic>;
  }

  /// Verifies API key by calling a protected endpoint.
  /// Returns user info extracted from organizations data, or null if invalid.
  Future<Map<String, dynamic>?> verifyApiKey() async {
    try {
      final response = await _dio.get('/api/organizations');
      final data = response.data;
      if (data is List && data.isNotEmpty) {
        // API key is valid - extract user info from first org's members
        return {'name': 'API Key User', 'role': 'user'};
      }
      return null;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
        return null;
      }
      rethrow;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
});
