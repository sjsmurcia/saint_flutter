import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.freezed.dart';
part 'client.g.dart';

@freezed
class Client with _$Client {
  const factory Client({
    required String id,
    required String tenantId,
    required String name,
    String? email,
    String? phone,
    required DateTime updatedAt,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
