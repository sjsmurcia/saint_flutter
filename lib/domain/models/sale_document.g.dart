// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SaleDocumentImpl _$$SaleDocumentImplFromJson(Map<String, dynamic> json) =>
    _$SaleDocumentImpl(
      id: json['id'] as String,
      tenantId: json['tenantId'] as String,
      companyId: json['companyId'] as String,
      branchId: json['branchId'] as String,
      total: (json['total'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$SaleDocumentImplToJson(_$SaleDocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'companyId': instance.companyId,
      'branchId': instance.branchId,
      'total': instance.total,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
