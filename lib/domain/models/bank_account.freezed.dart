// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

BankAccount _$BankAccountFromJson(Map<String, dynamic> json) {
  return _BankAccount.fromJson(json);
}

/// @nodoc
mixin _$BankAccount {
  String get id => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this BankAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BankAccountCopyWith<BankAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountCopyWith<$Res> {
  factory $BankAccountCopyWith(
    BankAccount value,
    $Res Function(BankAccount) then,
  ) = _$BankAccountCopyWithImpl<$Res, BankAccount>;
  @useResult
  $Res call({
    String id,
    String tenantId,
    String name,
    String currency,
    double balance,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$BankAccountCopyWithImpl<$Res, $Val extends BankAccount>
    implements $BankAccountCopyWith<$Res> {
  _$BankAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? name = null,
    Object? currency = null,
    Object? balance = null,
    Object? updatedAt = null,
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
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            currency: null == currency
                ? _value.currency
                : currency // ignore: cast_nullable_to_non_nullable
                      as String,
            balance: null == balance
                ? _value.balance
                : balance // ignore: cast_nullable_to_non_nullable
                      as double,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BankAccountImplCopyWith<$Res>
    implements $BankAccountCopyWith<$Res> {
  factory _$$BankAccountImplCopyWith(
    _$BankAccountImpl value,
    $Res Function(_$BankAccountImpl) then,
  ) = __$$BankAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String tenantId,
    String name,
    String currency,
    double balance,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$BankAccountImplCopyWithImpl<$Res>
    extends _$BankAccountCopyWithImpl<$Res, _$BankAccountImpl>
    implements _$$BankAccountImplCopyWith<$Res> {
  __$$BankAccountImplCopyWithImpl(
    _$BankAccountImpl _value,
    $Res Function(_$BankAccountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? name = null,
    Object? currency = null,
    Object? balance = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$BankAccountImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantId: null == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        currency: null == currency
            ? _value.currency
            : currency // ignore: cast_nullable_to_non_nullable
                  as String,
        balance: null == balance
            ? _value.balance
            : balance // ignore: cast_nullable_to_non_nullable
                  as double,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BankAccountImpl implements _BankAccount {
  const _$BankAccountImpl({
    required this.id,
    required this.tenantId,
    required this.name,
    required this.currency,
    required this.balance,
    required this.updatedAt,
  });

  factory _$BankAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountImplFromJson(json);

  @override
  final String id;
  @override
  final String tenantId;
  @override
  final String name;
  @override
  final String currency;
  @override
  final double balance;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'BankAccount(id: $id, tenantId: $tenantId, name: $name, currency: $currency, balance: $balance, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tenantId,
    name,
    currency,
    balance,
    updatedAt,
  );

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      __$$BankAccountImplCopyWithImpl<_$BankAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountImplToJson(this);
  }
}

abstract class _BankAccount implements BankAccount {
  const factory _BankAccount({
    required final String id,
    required final String tenantId,
    required final String name,
    required final String currency,
    required final double balance,
    required final DateTime updatedAt,
  }) = _$BankAccountImpl;

  factory _BankAccount.fromJson(Map<String, dynamic> json) =
      _$BankAccountImpl.fromJson;

  @override
  String get id;
  @override
  String get tenantId;
  @override
  String get name;
  @override
  String get currency;
  @override
  double get balance;
  @override
  DateTime get updatedAt;

  /// Create a copy of BankAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BankAccountImplCopyWith<_$BankAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
