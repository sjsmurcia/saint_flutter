import '../models/client.dart';

abstract class ClientRepository {
  Stream<List<Client>> watchAll();
  Future<List<Client>> fetchPage({required String tenantId, required int limit, required int offset});
  Future<void> sync(String tenantId);
}
