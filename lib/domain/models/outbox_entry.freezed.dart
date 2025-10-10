// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outbox_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

OutboxEntry _$OutboxEntryFromJson(Map<String, dynamic> json) {
  return _OutboxEntry.fromJson(json);
}

/// @nodoc
mixin _$OutboxEntry {
  String get id => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get entity => throw _privateConstructorUsedError;
  String get payload => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get processedAt => throw _privateConstructorUsedError;

  /// Serializes this OutboxEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutboxEntryCopyWith<OutboxEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutboxEntryCopyWith<$Res> {
  factory $OutboxEntryCopyWith(
    OutboxEntry value,
    $Res Function(OutboxEntry) then,
  ) = _$OutboxEntryCopyWithImpl<$Res, OutboxEntry>;
  @useResult
  $Res call({
    String id,
    String tenantId,
    String entity,
    String payload,
    String status,
    DateTime createdAt,
    DateTime? processedAt,
  });
}

/// @nodoc
class _$OutboxEntryCopyWithImpl<$Res, $Val extends OutboxEntry>
    implements $OutboxEntryCopyWith<$Res> {
  _$OutboxEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? entity = null,
    Object? payload = null,
    Object? status = null,
    Object? createdAt = null,
    Object? processedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            tenantId: null == tenantId
                ? _value.tenantId
                : tenantId // ignore: cast_nullable_to_non_nullable
                      as String,
            entity: null == entity
                ? _value.entity
                : entity // ignore: cast_nullable_to_non_nullable
                      as String,
            payload: null == payload
                ? _value.payload
                : payload // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            processedAt: freezed == processedAt
                ? _value.processedAt
                : processedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OutboxEntryImplCopyWith<$Res>
    implements $OutboxEntryCopyWith<$Res> {
  factory _$$OutboxEntryImplCopyWith(
    _$OutboxEntryImpl value,
    $Res Function(_$OutboxEntryImpl) then,
  ) = __$$OutboxEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String tenantId,
    String entity,
    String payload,
    String status,
    DateTime createdAt,
    DateTime? processedAt,
  });
}

/// @nodoc
class __$$OutboxEntryImplCopyWithImpl<$Res>
    extends _$OutboxEntryCopyWithImpl<$Res, _$OutboxEntryImpl>
    implements _$$OutboxEntryImplCopyWith<$Res> {
  __$$OutboxEntryImplCopyWithImpl(
    _$OutboxEntryImpl _value,
    $Res Function(_$OutboxEntryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? entity = null,
    Object? payload = null,
    Object? status = null,
    Object? createdAt = null,
    Object? processedAt = freezed,
  }) {
    return _then(
      _$OutboxEntryImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantId: null == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String,
        entity: null == entity
            ? _value.entity
            : entity // ignore: cast_nullable_to_non_nullable
                  as String,
        payload: null == payload
            ? _value.payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        processedAt: freezed == processedAt
            ? _value.processedAt
            : processedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OutboxEntryImpl implements _OutboxEntry {
  const _$OutboxEntryImpl({
    required this.id,
    required this.tenantId,
    required this.entity,
    required this.payload,
    required this.status,
    required this.createdAt,
    this.processedAt,
  });

  factory _$OutboxEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutboxEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String tenantId;
  @override
  final String entity;
  @override
  final String payload;
  @override
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime? processedAt;

  @override
  String toString() {
    return 'OutboxEntry(id: $id, tenantId: $tenantId, entity: $entity, payload: $payload, status: $status, createdAt: $createdAt, processedAt: $processedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutboxEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.processedAt, processedAt) ||
                other.processedAt == processedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tenantId,
    entity,
    payload,
    status,
    createdAt,
    processedAt,
  );

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutboxEntryImplCopyWith<_$OutboxEntryImpl> get copyWith =>
      __$$OutboxEntryImplCopyWithImpl<_$OutboxEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutboxEntryImplToJson(this);
  }
}

abstract class _OutboxEntry implements OutboxEntry {
  const factory _OutboxEntry({
    required final String id,
    required final String tenantId,
    required final String entity,
    required final String payload,
    required final String status,
    required final DateTime createdAt,
    final DateTime? processedAt,
  }) = _$OutboxEntryImpl;

  factory _OutboxEntry.fromJson(Map<String, dynamic> json) =
      _$OutboxEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get tenantId;
  @override
  String get entity;
  @override
  String get payload;
  @override
  String get status;
  @override
  DateTime get createdAt;
  @override
  DateTime? get processedAt;

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutboxEntryImplCopyWith<_$OutboxEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
