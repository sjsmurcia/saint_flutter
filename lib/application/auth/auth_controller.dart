import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._repository) : super(const AuthState.unknown()) {
    _restore();
  }

  final AuthRepository _repository;

  Future<void> _restore() async {
    try {
      final session = await _repository.restoreSession();
      if (session != null) {
        state = AuthState.authenticated(session);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (_) {
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AuthState.loading();
    try {
      final session = await _repository.login(email: email, password: password);
      state = AuthState.authenticated(session);
    } catch (_) {
      state = const AuthState.error('Credenciales invalidas');
    }
  }

  Future<void> logout() async {
    await _repository.logout();
    state = const AuthState.unauthenticated();
  }
}
