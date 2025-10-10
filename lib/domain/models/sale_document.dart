import 'package:freezed_annotation/freezed_annotation.dart';

part 'sale_document.freezed.dart';
part 'sale_document.g.dart';

@freezed
class SaleDocument with _$SaleDocument {
  const factory SaleDocument({
    required String id,
    required String tenantId,
    required String companyId,
    required String branchId,
    required double total,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _SaleDocument;

  factory SaleDocument.fromJson(Map<String, dynamic> json) =>
      _$SaleDocumentFromJson(json);
}
