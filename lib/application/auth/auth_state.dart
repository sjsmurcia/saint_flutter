import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/user_session.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unknown() = AuthStateUnknown;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated(UserSession session) =
      AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnauthenticated;
  const factory AuthState.error(String message) = AuthStateError;
}
