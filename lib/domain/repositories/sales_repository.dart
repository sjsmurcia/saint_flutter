import '../models/sale_document.dart';

abstract class SalesRepository {
  Stream<List<SaleDocument>> watchAll();
  Future<SaleDocument> createDraft({
    required String tenantId,
    required String companyId,
    required String branchId,
    required double total,
  });
  Future<void> updateStatus({required String id, required String status});
}
