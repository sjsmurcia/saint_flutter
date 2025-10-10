// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      branches: (json['branches'] as List<dynamic>)
          .map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'branches': instance.branches,
    };

_$BranchImpl _$$BranchImplFromJson(Map<String, dynamic> json) =>
    _$BranchImpl(id: json['id'] as String, name: json['name'] as String);

Map<String, dynamic> _$$BranchImplToJson(_$BranchImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
