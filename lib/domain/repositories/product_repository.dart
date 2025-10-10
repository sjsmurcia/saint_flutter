import '../models/product.dart';

abstract class ProductRepository {
  Stream<List<Product>> watchAll();
  Future<void> sync(String tenantId);
}
