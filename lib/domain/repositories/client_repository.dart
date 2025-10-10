import '../models/client.dart';

abstract class ClientRepository {
  Stream<List<Client>> watchAll();
  Future<void> sync(String tenantId);
}
