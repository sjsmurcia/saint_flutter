import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_movement.freezed.dart';
part 'bank_movement.g.dart';

@freezed
class BankMovement with _$BankMovement {
  const factory BankMovement({
    required String id,
    required String tenantId,
    required String accountId,
    required double amount,
    required String type,
    String? description,
    required DateTime occurredAt,
    required String status,
    required DateTime createdAt,
  }) = _BankMovement;

  factory BankMovement.fromJson(Map<String, dynamic> json) =>
      _$BankMovementFromJson(json);
}
