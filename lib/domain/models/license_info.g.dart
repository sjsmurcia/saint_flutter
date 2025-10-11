// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'license_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LicenseInfoImpl _$$LicenseInfoImplFromJson(Map<String, dynamic> json) =>
    _$LicenseInfoImpl(
      token: json['token'] as String,
      licenseId: json['licenseId'] as String,
      tenantId: json['tenantId'] as String,
      licenseType: json['licenseType'] as String,
      entitlements: (json['entitlements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      issuedAt: DateTime.parse(json['issuedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
      lastCheckInAt: DateTime.parse(json['lastCheckInAt'] as String),
      checkIntervalDays: (json['checkIntervalDays'] as num).toInt(),
      graceDays: (json['graceDays'] as num).toInt(),
    );

Map<String, dynamic> _$$LicenseInfoImplToJson(_$LicenseInfoImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'licenseId': instance.licenseId,
      'tenantId': instance.tenantId,
      'licenseType': instance.licenseType,
      'entitlements': instance.entitlements,
      'issuedAt': instance.issuedAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
      'lastCheckInAt': instance.lastCheckInAt.toIso8601String(),
      'checkIntervalDays': instance.checkIntervalDays,
      'graceDays': instance.graceDays,
    };
