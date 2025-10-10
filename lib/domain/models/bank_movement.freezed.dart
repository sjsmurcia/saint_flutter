// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BankMovement _$BankMovementFromJson(Map<String, dynamic> json) {
  return _BankMovement.fromJson(json);
}

/// @nodoc
mixin _$BankMovement {
  String get id => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get accountId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get occurredAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this BankMovement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankMovementCopyWith<BankMovement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankMovementCopyWith<$Res> {
  factory $BankMovementCopyWith(
    BankMovement value,
    $Res Function(BankMovement) then,
  ) = _$BankMovementCopyWithImpl<$Res, BankMovement>;
  @useResult
  $Res call({
    String id,
    String tenantId,
    String accountId,
    double amount,
    String type,
    String? description,
    DateTime occurredAt,
    String status,
    DateTime createdAt,
  });
}

/// @nodoc
class _$BankMovementCopyWithImpl<$Res, $Val extends BankMovement>
    implements $BankMovementCopyWith<$Res> {
  _$BankMovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? accountId = null,
    Object? amount = null,
    Object? type = null,
    Object? description = freezed,
    Object? occurredAt = null,
    Object? status = null,
    Object? createdAt = null,
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
            accountId: null == accountId
                ? _value.accountId
                : accountId // ignore: cast_nullable_to_non_nullable
                      as String,
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            occurredAt: null == occurredAt
                ? _value.occurredAt
                : occurredAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BankMovementImplCopyWith<$Res>
    implements $BankMovementCopyWith<$Res> {
  factory _$$BankMovementImplCopyWith(
    _$BankMovementImpl value,
    $Res Function(_$BankMovementImpl) then,
  ) = __$$BankMovementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String tenantId,
    String accountId,
    double amount,
    String type,
    String? description,
    DateTime occurredAt,
    String status,
    DateTime createdAt,
  });
}

/// @nodoc
class __$$BankMovementImplCopyWithImpl<$Res>
    extends _$BankMovementCopyWithImpl<$Res, _$BankMovementImpl>
    implements _$$BankMovementImplCopyWith<$Res> {
  __$$BankMovementImplCopyWithImpl(
    _$BankMovementImpl _value,
    $Res Function(_$BankMovementImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? accountId = null,
    Object? amount = null,
    Object? type = null,
    Object? description = freezed,
    Object? occurredAt = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(
      _$BankMovementImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantId: null == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String,
        accountId: null == accountId
            ? _value.accountId
            : accountId // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        occurredAt: null == occurredAt
            ? _value.occurredAt
            : occurredAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BankMovementImpl implements _BankMovement {
  const _$BankMovementImpl({
    required this.id,
    required this.tenantId,
    required this.accountId,
    required this.amount,
    required this.type,
    this.description,
    required this.occurredAt,
    required this.status,
    required this.createdAt,
  });

  factory _$BankMovementImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankMovementImplFromJson(json);

  @override
  final String id;
  @override
  final String tenantId;
  @override
  final String accountId;
  @override
  final double amount;
  @override
  final String type;
  @override
  final String? description;
  @override
  final DateTime occurredAt;
  @override
  final String status;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'BankMovement(id: $id, tenantId: $tenantId, accountId: $accountId, amount: $amount, type: $type, description: $description, occurredAt: $occurredAt, status: $status, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankMovementImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.occurredAt, occurredAt) ||
                other.occurredAt == occurredAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tenantId,
    accountId,
    amount,
    type,
    description,
    occurredAt,
    status,
    createdAt,
  );

  /// Create a copy of BankMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankMovementImplCopyWith<_$BankMovementImpl> get copyWith =>
      __$$BankMovementImplCopyWithImpl<_$BankMovementImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankMovementImplToJson(this);
  }
}

abstract class _BankMovement implements BankMovement {
  const factory _BankMovement({
    required final String id,
    required final String tenantId,
    required final String accountId,
    required final double amount,
    required final String type,
    final String? description,
    required final DateTime occurredAt,
    required final String status,
    required final DateTime createdAt,
  }) = _$BankMovementImpl;

  factory _BankMovement.fromJson(Map<String, dynamic> json) =
      _$BankMovementImpl.fromJson;

  @override
  String get id;
  @override
  String get tenantId;
  @override
  String get accountId;
  @override
  double get amount;
  @override
  String get type;
  @override
  String? get description;
  @override
  DateTime get occurredAt;
  @override
  String get status;
  @override
  DateTime get createdAt;

  /// Create a copy of BankMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankMovementImplCopyWith<_$BankMovementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
