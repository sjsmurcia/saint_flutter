import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_session.freezed.dart';
part 'user_session.g.dart';

@freezed
class UserSession with _$UserSession {
  const factory UserSession({
    required String token,
    required DateTime expiresAt,
    required String tenantId,
    required String userName,
  }) = _UserSession;

  factory UserSession.fromJson(Map<String, dynamic> json) =>
      _$UserSessionFromJson(json);
}
