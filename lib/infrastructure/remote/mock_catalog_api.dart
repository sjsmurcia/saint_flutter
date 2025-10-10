import 'dart:async';

class MockCatalogApi {
  Future<List<Map<String, dynamic>>> fetchProducts({
    required String tenantId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final now = DateTime.now().toIso8601String();
    return [
      {
        'id': 'prd-001',
        'tenantId': tenantId,
        'companyId': 'comp-001',
        'branchId': 'br-001',
        'name': 'Impresora termica 58mm',
        'sku': 'IMP-58',
        'price': 149.99,
        'updatedAt': now,
      },
      {
        'id': 'prd-002',
        'tenantId': tenantId,
        'companyId': 'comp-001',
        'branchId': 'br-002',
        'name': 'Lector codigo de barras USB',
        'sku': 'BAR-USB',
        'price': 89.50,
        'updatedAt': now,
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchClients({
    required String tenantId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    final now = DateTime.now().toIso8601String();
    return [
      {
        'id': 'cli-001',
        'tenantId': tenantId,
        'name': 'Comercial La Laguna',
        'email': 'compras@laguna.mx',
        'phone': '+52 33 1234 5678',
        'updatedAt': now,
      },
      {
        'id': 'cli-002',
        'tenantId': tenantId,
        'name': 'Distribuidora Norte',
        'email': 'ventas@dsnorte.mx',
        'phone': '+52 81 9876 5432',
        'updatedAt': now,
      },
    ];
  }

  Future<List<Map<String, dynamic>>> fetchCompanies({
    required String tenantId,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    return [
      {
        'id': 'comp-001',
        'name': 'Casa Matriz',
        'branches': [
          {'id': 'br-001', 'name': 'Sucursal Centro'},
          {'id': 'br-002', 'name': 'Sucursal Norte'},
        ],
      },
      {
        'id': 'comp-002',
        'name': 'Distribuidora Andina',
        'branches': [
          {'id': 'br-101', 'name': 'Qro'},
          {'id': 'br-102', 'name': 'CDMX'},
        ],
      },
    ];
  }
}
