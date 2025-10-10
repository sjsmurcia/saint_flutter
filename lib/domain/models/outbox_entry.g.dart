// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outbox_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutboxEntryImpl _$$OutboxEntryImplFromJson(Map<String, dynamic> json) =>
    _$OutboxEntryImpl(
      id: json['id'] as String,
      tenantId: json['tenantId'] as String,
      entity: json['entity'] as String,
      payload: json['payload'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      processedAt: json['processedAt'] == null
          ? null
          : DateTime.parse(json['processedAt'] as String),
    );

Map<String, dynamic> _$$OutboxEntryImplToJson(_$OutboxEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'entity': instance.entity,
      'payload': instance.payload,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'processedAt': instance.processedAt?.toIso8601String(),
    };
