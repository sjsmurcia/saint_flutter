// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankAccountImpl _$$BankAccountImplFromJson(Map<String, dynamic> json) =>
    _$BankAccountImpl(
      id: json['id'] as String,
      tenantId: json['tenantId'] as String,
      name: json['name'] as String,
      currency: json['currency'] as String,
      balance: (json['balance'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BankAccountImplToJson(_$BankAccountImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'name': instance.name,
      'currency': instance.currency,
      'balance': instance.balance,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
