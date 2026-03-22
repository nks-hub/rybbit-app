import 'package:flutter_test/flutter_test.dart';
import 'package:rybbit_unofficial/features/auth/application/auth_controller.dart';

void main() {
  group('AuthState', () {
    test('default state has unknown status', () {
      const state = AuthState();
      expect(state.status, AuthStatus.unknown);
      expect(state.user, isNull);
      expect(state.error, isNull);
      expect(state.isLoading, isFalse);
    });

    test('copyWith preserves unchanged fields', () {
      const state = AuthState(
        status: AuthStatus.authenticated,
        user: {'name': 'test'},
        isLoading: false,
      );

      final updated = state.copyWith(isLoading: true);
      expect(updated.status, AuthStatus.authenticated);
      expect(updated.user, {'name': 'test'});
      expect(updated.isLoading, isTrue);
      expect(updated.error, isNull);
    });

    test('copyWith clears error when set to null', () {
      const state = AuthState(
        status: AuthStatus.unauthenticated,
        error: 'some error',
      );

      final updated = state.copyWith(error: null);
      expect(updated.error, isNull);
      expect(updated.status, AuthStatus.unauthenticated);
    });

    test('copyWith can set error', () {
      const state = AuthState();
      final updated = state.copyWith(error: 'connection failed');
      expect(updated.error, 'connection failed');
    });

    test('copyWith can transition status', () {
      const state = AuthState(status: AuthStatus.unknown);
      final updated = state.copyWith(status: AuthStatus.authenticated);
      expect(updated.status, AuthStatus.authenticated);
    });
  });
}
