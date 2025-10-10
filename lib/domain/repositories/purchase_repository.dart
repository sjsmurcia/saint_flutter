import '../models/purchase_document.dart';

abstract class PurchaseRepository {
  Stream<List<PurchaseDocument>> watchAll();
  Future<PurchaseDocument> createDraft({
    required String tenantId,
    required String companyId,
    required String branchId,
    required double total,
  });
  Future<void> updateStatus({required String id, required String status});
}
