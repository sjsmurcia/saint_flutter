import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_document.freezed.dart';
part 'report_document.g.dart';

@freezed
class ReportDocument with _$ReportDocument {
  const factory ReportDocument({
    required String id,
    required String name,
    required String path,
    required DateTime downloadedAt,
    required String type,
    String? referenceId,
    String? contentType,
  }) = _ReportDocument;

  factory ReportDocument.fromJson(Map<String, dynamic> json) =>
      _$ReportDocumentFromJson(json);
}
