import 'package:drift/drift.dart';

import '../../domain/models/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../local/dao/product_dao.dart';
import '../local/database/app_database.dart';
import '../remote/mock_catalog_api.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this._dao, this._api);

  final ProductDao _dao;
  final MockCatalogApi _api;

  @override
  Stream<List<Product>> watchAll() {
    return _dao.watchAll().map(
      (rows) => rows
          .map(
            (row) => Product(
              id: row.id,
              tenantId: row.tenantId,
              companyId: row.companyId,
              branchId: row.branchId,
              name: row.name,
              sku: row.sku,
              price: row.price,
              updatedAt: row.updatedAt,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<List<Product>> fetchPage({
    required String tenantId,
    required int limit,
    required int offset,
  }) async {
    final rows = await _dao.fetchPage(
      tenantId: tenantId,
      limit: limit,
      offset: offset,
    );
    return rows
        .map(
          (row) => Product(
            id: row.id,
            tenantId: row.tenantId,
            companyId: row.companyId,
            branchId: row.branchId,
            name: row.name,
            sku: row.sku,
            price: row.price,
            updatedAt: row.updatedAt,
          ),
        )
        .toList();
  }

  @override
  Future<void> sync(String tenantId) async {
    final payload = await _api.fetchProducts(tenantId: tenantId);
    final models = payload
        .map((data) => Product.fromJson(Map<String, dynamic>.from(data)))
        .toList();
    final entries = models
        .map(
          (product) => ProductsCompanion(
            id: Value(product.id),
            tenantId: Value(product.tenantId),
            companyId: Value(product.companyId),
            branchId: Value(product.branchId),
            name: Value(product.name),
            sku: Value(product.sku),
            price: Value(product.price),
            updatedAt: Value(product.updatedAt),
          ),
        )
        .toList();
    await _dao.replaceAll(entries);
  }
}
