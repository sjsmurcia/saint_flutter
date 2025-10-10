import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/models/user_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../remote/mock_auth_api.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._api, this._storage);

  final MockAuthApi _api;
  final FlutterSecureStorage _storage;

  static const _sessionKey = 'auth_session';

  @override
  Future<UserSession> login({
    required String email,
    required String password,
  }) async {
    final payload = await _api.login(email: email, password: password);
    final session = UserSession.fromJson(payload);
    await _storage.write(key: _sessionKey, value: jsonEncode(session.toJson()));
    return session;
  }

  @override
  Future<void> logout() async {
    await _storage.delete(key: _sessionKey);
  }

  @override
  Future<UserSession?> restoreSession() async {
    final raw = await _storage.read(key: _sessionKey);
    if (raw == null) {
      return null;
    }
    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final session = UserSession.fromJson(data);
      if (session.expiresAt.isBefore(DateTime.now())) {
        await _storage.delete(key: _sessionKey);
        return null;
      }
      return session;
    } catch (_) {
      await _storage.delete(key: _sessionKey);
      return null;
    }
  }
}
