// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BankMovementImpl _$$BankMovementImplFromJson(Map<String, dynamic> json) =>
    _$BankMovementImpl(
      id: json['id'] as String,
      tenantId: json['tenantId'] as String,
      accountId: json['accountId'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      description: json['description'] as String?,
      occurredAt: DateTime.parse(json['occurredAt'] as String),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BankMovementImplToJson(_$BankMovementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'accountId': instance.accountId,
      'amount': instance.amount,
      'type': instance.type,
      'description': instance.description,
      'occurredAt': instance.occurredAt.toIso8601String(),
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
    };
