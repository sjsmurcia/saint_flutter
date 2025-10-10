import '../models/outbox_entry.dart';

abstract class OutboxRepository {
  Future<void> enqueue({
    required String tenantId,
    required String entity,
    required Map<String, dynamic> payload,
  });

  Future<List<OutboxEntry>> loadPending();
  Future<void> markProcessed(String id);
  Stream<List<OutboxEntry>> watchPending();
}
