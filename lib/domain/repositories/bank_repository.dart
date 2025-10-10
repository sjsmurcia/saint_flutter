import '../models/bank_account.dart';
import '../models/bank_movement.dart';

abstract class BankRepository {
  Stream<List<BankAccount>> watchAccounts(String tenantId);
  Stream<List<BankMovement>> watchMovements(String accountId);

  Future<BankMovement> registerMovement({
    required String tenantId,
    required String accountId,
    required double amount,
    required String type,
    String? description,
    required DateTime occurredAt,
  });

  Future<void> updateMovementStatus({
    required String id,
    required String status,
  });
  Future<void> ensureDemoAccounts(String tenantId);
}
