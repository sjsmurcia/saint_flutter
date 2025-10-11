import '../models/product.dart';

abstract class ProductRepository {
  Stream<List<Product>> watchAll();
  Future<List<Product>> fetchPage({required String tenantId, required int limit, required int offset});
  Future<void> sync(String tenantId);
}
