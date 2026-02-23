import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/config/app_config.dart';
import '../../../core/storage/storage_service.dart';
import '../data/auth_repository.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState {
  final AuthStatus status;
  final Map<String, dynamic>? user;
  final String? error;
  final bool isLoading;

  const AuthState({
    this.status = AuthStatus.unknown,
    this.user,
    this.error,
    this.isLoading = false,
  });

  AuthState copyWith({
    AuthStatus? status,
    Map<String, dynamic>? user,
    String? error,
    bool? isLoading,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthController extends Notifier<AuthState> {
  static const connectionFailedError = 'err:connection_failed';
  static const invalidApiKeyError = 'err:invalid_api_key';
  static const connectionFailedApiKeyError = 'err:connection_failed_api_key';

  @override
  AuthState build() {
    return const AuthState();
  }

  Future<void> login(
    String serverUrl,
    String email,
    String password,
  ) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      ref.read(appConfigNotifierProvider.notifier).setConfig(
            serverUrl: serverUrl,
          );

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final repo = ref.read(authRepositoryProvider);
      final result = await repo.login(email, password);

      await StorageService.saveSecure('server_url', serverUrl);
      await StorageService.saveSecure('last_email', email);
      await StorageService.deleteSecure('api_key');

      // Session cookie is automatically persisted by PersistCookieJar
      final user = result['user'] as Map<String, dynamic>?;

      state = AuthState(
        status: AuthStatus.authenticated,
        user: user ?? result,
      );
    } on DioException catch (e) {
      final message = e.response?.data?['message']?.toString() ??
          e.response?.data?['error']?.toString() ??
          connectionFailedError;
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        isLoading: false,
        error: message,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> loginWithApiKey(String serverUrl, String apiKey) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      ref.read(appConfigNotifierProvider.notifier).setConfig(
            serverUrl: serverUrl,
            apiKey: apiKey,
          );

      await Future<void>.delayed(const Duration(milliseconds: 100));

      final repo = ref.read(authRepositoryProvider);
      final user = await repo.verifyApiKey();

      if (user == null) {
        state = state.copyWith(
          status: AuthStatus.unauthenticated,
          isLoading: false,
          error: invalidApiKeyError,
        );
        return;
      }

      await StorageService.saveSecure('server_url', serverUrl);
      await StorageService.saveSecure('api_key', apiKey);

      state = AuthState(
        status: AuthStatus.authenticated,
        user: user,
      );
    } on DioException catch (e) {
      final message = e.response?.data?['message']?.toString() ??
          connectionFailedApiKeyError;
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        isLoading: false,
        error: message,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> checkSession() async {
    final serverUrl = await StorageService.readSecure('server_url');
    final apiKey = await StorageService.readSecure('api_key');

    if (serverUrl == null || serverUrl.isEmpty) {
      state = const AuthState(status: AuthStatus.unauthenticated);
      return;
    }

    ref.read(appConfigNotifierProvider.notifier).setConfig(
          serverUrl: serverUrl,
          apiKey: apiKey,
        );

    await Future<void>.delayed(const Duration(milliseconds: 100));

    try {
      final repo = ref.read(authRepositoryProvider);

      if (apiKey != null && apiKey.isNotEmpty) {
        // API key auth
        final user = await repo.verifyApiKey();
        if (user != null) {
          state = AuthState(
            status: AuthStatus.authenticated,
            user: user,
          );
        } else {
          state = const AuthState(status: AuthStatus.unauthenticated);
        }
      } else {
        // Session cookie auth - PersistCookieJar has the cookies
        final session = await repo.getSession();
        if (session != null) {
          final user = session['user'] as Map<String, dynamic>?;
          state = AuthState(
            status: AuthStatus.authenticated,
            user: user ?? session,
          );
        } else {
          state = const AuthState(status: AuthStatus.unauthenticated);
        }
      }
    } catch (_) {
      state = const AuthState(status: AuthStatus.unauthenticated);
    }
  }

  Future<void> logout() async {
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.logout();
    } catch (_) {
      // Logout even if API call fails
    }

    await StorageService.deleteSecure('api_key');
    ref.read(appConfigNotifierProvider.notifier).clear();

    state = const AuthState(status: AuthStatus.unauthenticated);
  }
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);
