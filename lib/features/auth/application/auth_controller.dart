import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/config/app_config.dart';
import '../../../core/network/dio_provider.dart';
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

  /// Applies config and invalidates the Dio provider so that
  /// subsequent reads return a client with the updated baseUrl/apiKey.
  void _applyConfig({required String serverUrl, String? apiKey}) {
    ref.read(appConfigNotifierProvider.notifier).setConfig(
          serverUrl: serverUrl,
          apiKey: apiKey,
        );
    ref.invalidate(dioProvider);
  }

  Future<void> login(
    String serverUrl,
    String email,
    String password,
  ) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      _applyConfig(serverUrl: serverUrl);

      final repo = ref.read(authRepositoryProvider);
      final result = await repo.login(email, password);

      await StorageService.saveSecure('server_url', serverUrl);
      await StorageService.saveSecure('last_email', email);
      await StorageService.saveSecure('last_password', password);
      await StorageService.deleteSecure('api_key');
      await StorageService.stampCredentialTime();

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
      _applyConfig(serverUrl: serverUrl, apiKey: apiKey);

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
      await StorageService.stampCredentialTime();

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

    // Credentials expired - require fresh login
    if (StorageService.areCredentialsExpired()) {
      await StorageService.clearCredentials();
      state = const AuthState(status: AuthStatus.unauthenticated);
      return;
    }

    _applyConfig(serverUrl: serverUrl, apiKey: apiKey);

    try {
      final repo = ref.read(authRepositoryProvider);

      if (apiKey != null && apiKey.isNotEmpty) {
        final user = await repo.verifyApiKey();
        if (user != null) {
          state = AuthState(
            status: AuthStatus.authenticated,
            user: user,
          );
          return;
        }
      } else {
        final session = await repo.getSession();
        if (session != null) {
          final user = session['user'] as Map<String, dynamic>?;
          state = AuthState(
            status: AuthStatus.authenticated,
            user: user ?? session,
          );
          return;
        }
      }
    } catch (_) {
      // Session check failed, will try re-login below
    }

    // Session expired or cookie lost - try silent re-login with saved credentials
    await _tryAutoReLogin(serverUrl);
  }

  Future<void> _tryAutoReLogin(String serverUrl) async {
    final email = await StorageService.readSecure('last_email');
    final password = await StorageService.readSecure('last_password');

    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      try {
        _applyConfig(serverUrl: serverUrl);

        final repo = ref.read(authRepositoryProvider);
        final result = await repo.login(email, password);
        final user = result['user'] as Map<String, dynamic>?;
        state = AuthState(
          status: AuthStatus.authenticated,
          user: user ?? result,
        );
        return;
      } catch (_) {
        // Auto re-login failed - fall through to unauthenticated
      }
    }

    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  Future<void> logout() async {
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.logout();
    } catch (_) {
      // Logout even if API call fails
    }

    await StorageService.clearCredentials();
    await StorageService.deleteSecure('server_url');
    ref.read(appConfigNotifierProvider.notifier).clear();

    state = const AuthState(status: AuthStatus.unauthenticated);
  }
}

final authControllerProvider =
    NotifierProvider<AuthController, AuthState>(AuthController.new);
