import 'package:freezed_annotation/freezed_annotation.dart';

part 'outbox_entry.freezed.dart';
part 'outbox_entry.g.dart';

@freezed
class OutboxEntry with _$OutboxEntry {
  const factory OutboxEntry({
    required String id,
    required String tenantId,
    required String entity,
    required String payload,
    required String status,
    required DateTime createdAt,
    DateTime? processedAt,
  }) = _OutboxEntry;

  factory OutboxEntry.fromJson(Map<String, dynamic> json) =>
      _$OutboxEntryFromJson(json);
}
