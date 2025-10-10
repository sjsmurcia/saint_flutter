// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportDocumentImpl _$$ReportDocumentImplFromJson(Map<String, dynamic> json) =>
    _$ReportDocumentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String,
      downloadedAt: DateTime.parse(json['downloadedAt'] as String),
      type: json['type'] as String,
      referenceId: json['referenceId'] as String?,
      contentType: json['contentType'] as String?,
    );

Map<String, dynamic> _$$ReportDocumentImplToJson(
  _$ReportDocumentImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'path': instance.path,
  'downloadedAt': instance.downloadedAt.toIso8601String(),
  'type': instance.type,
  'referenceId': instance.referenceId,
  'contentType': instance.contentType,
};
