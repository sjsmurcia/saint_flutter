import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_document.freezed.dart';
part 'purchase_document.g.dart';

@freezed
class PurchaseDocument with _$PurchaseDocument {
  const factory PurchaseDocument({
    required String id,
    required String tenantId,
    required String companyId,
    required String branchId,
    required double total,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PurchaseDocument;

  factory PurchaseDocument.fromJson(Map<String, dynamic> json) =>
      _$PurchaseDocumentFromJson(json);
}
