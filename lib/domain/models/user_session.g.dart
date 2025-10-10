// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSessionImpl _$$UserSessionImplFromJson(Map<String, dynamic> json) =>
    _$UserSessionImpl(
      token: json['token'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      tenantId: json['tenantId'] as String,
      userName: json['userName'] as String,
    );

Map<String, dynamic> _$$UserSessionImplToJson(_$UserSessionImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'tenantId': instance.tenantId,
      'userName': instance.userName,
    };
