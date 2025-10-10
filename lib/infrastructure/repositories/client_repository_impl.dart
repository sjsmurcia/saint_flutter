import 'package:drift/drift.dart';

import '../../domain/models/client.dart';
import '../../domain/repositories/client_repository.dart';
import '../local/dao/client_dao.dart';
import '../local/database/app_database.dart';
import '../remote/mock_catalog_api.dart';

class ClientRepositoryImpl implements ClientRepository {
  ClientRepositoryImpl(this._dao, this._api);

  final ClientDao _dao;
  final MockCatalogApi _api;

  @override
  Stream<List<Client>> watchAll() {
    return _dao.watchAll().map(
      (rows) => rows
          .map(
            (row) => Client(
              id: row.id,
              tenantId: row.tenantId,
              name: row.name,
              email: row.email,
              phone: row.phone,
              updatedAt: row.updatedAt,
            ),
          )
          .toList(),
    );
  }

  @override
  Future<void> sync(String tenantId) async {
    final payload = await _api.fetchClients(tenantId: tenantId);
    final models = payload
        .map((data) => Client.fromJson(Map<String, dynamic>.from(data)))
        .toList();
    final entries = models
        .map(
          (client) => ClientsCompanion(
            id: Value(client.id),
            tenantId: Value(client.tenantId),
            name: Value(client.name),
            email: Value(client.email),
            phone: Value(client.phone),
            updatedAt: Value(client.updatedAt),
          ),
        )
        .toList();
    await _dao.replaceAll(entries);
  }
}
