// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      tenantId: json['tenantId'] as String,
      companyId: json['companyId'] as String,
      branchId: json['branchId'] as String?,
      name: json['name'] as String,
      sku: json['sku'] as String,
      price: (json['price'] as num).toDouble(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'companyId': instance.companyId,
      'branchId': instance.branchId,
      'name': instance.name,
      'sku': instance.sku,
      'price': instance.price,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
