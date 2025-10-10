// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClientImpl _$$ClientImplFromJson(Map<String, dynamic> json) => _$ClientImpl(
  id: json['id'] as String,
  tenantId: json['tenantId'] as String,
  name: json['name'] as String,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$ClientImplToJson(_$ClientImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
