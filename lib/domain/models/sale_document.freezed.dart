// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SaleDocument _$SaleDocumentFromJson(Map<String, dynamic> json) {
  return _SaleDocument.fromJson(json);
}

/// @nodoc
mixin _$SaleDocument {
  String get id => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get companyId => throw _privateConstructorUsedError;
  String get branchId => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this SaleDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SaleDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SaleDocumentCopyWith<SaleDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleDocumentCopyWith<$Res> {
  factory $SaleDocumentCopyWith(
    SaleDocument value,
    $Res Function(SaleDocument) then,
  ) = _$SaleDocumentCopyWithImpl<$Res, SaleDocument>;
  @useResult
  $Res call({
    String id,
    String tenantId,
    String companyId,
    String branchId,
    double total,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$SaleDocumentCopyWithImpl<$Res, $Val extends SaleDocument>
    implements $SaleDocumentCopyWith<$Res> {
  _$SaleDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SaleDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? companyId = null,
    Object? branchId = null,
    Object? total = null,
    Object? status = null,
    Object? createdAt = null,
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
            companyId: null == companyId
                ? _value.companyId
                : companyId // ignore: cast_nullable_to_non_nullable
                      as String,
            branchId: null == branchId
                ? _value.branchId
                : branchId // ignore: cast_nullable_to_non_nullable
                      as String,
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as double,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
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
abstract class _$$SaleDocumentImplCopyWith<$Res>
    implements $SaleDocumentCopyWith<$Res> {
  factory _$$SaleDocumentImplCopyWith(
    _$SaleDocumentImpl value,
    $Res Function(_$SaleDocumentImpl) then,
  ) = __$$SaleDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String tenantId,
    String companyId,
    String branchId,
    double total,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$SaleDocumentImplCopyWithImpl<$Res>
    extends _$SaleDocumentCopyWithImpl<$Res, _$SaleDocumentImpl>
    implements _$$SaleDocumentImplCopyWith<$Res> {
  __$$SaleDocumentImplCopyWithImpl(
    _$SaleDocumentImpl _value,
    $Res Function(_$SaleDocumentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SaleDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? companyId = null,
    Object? branchId = null,
    Object? total = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$SaleDocumentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantId: null == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String,
        companyId: null == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                  as String,
        branchId: null == branchId
            ? _value.branchId
            : branchId // ignore: cast_nullable_to_non_nullable
                  as String,
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as double,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
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
class _$SaleDocumentImpl implements _SaleDocument {
  const _$SaleDocumentImpl({
    required this.id,
    required this.tenantId,
    required this.companyId,
    required this.branchId,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$SaleDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleDocumentImplFromJson(json);

  @override
  final String id;
  @override
  final String tenantId;
  @override
  final String companyId;
  @override
  final String branchId;
  @override
  final double total;
  @override
  final String status;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SaleDocument(id: $id, tenantId: $tenantId, companyId: $companyId, branchId: $branchId, total: $total, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    tenantId,
    companyId,
    branchId,
    total,
    status,
    createdAt,
    updatedAt,
  );

  /// Create a copy of SaleDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleDocumentImplCopyWith<_$SaleDocumentImpl> get copyWith =>
      __$$SaleDocumentImplCopyWithImpl<_$SaleDocumentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleDocumentImplToJson(this);
  }
}

abstract class _SaleDocument implements SaleDocument {
  const factory _SaleDocument({
    required final String id,
    required final String tenantId,
    required final String companyId,
    required final String branchId,
    required final double total,
    required final String status,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$SaleDocumentImpl;

  factory _SaleDocument.fromJson(Map<String, dynamic> json) =
      _$SaleDocumentImpl.fromJson;

  @override
  String get id;
  @override
  String get tenantId;
  @override
  String get companyId;
  @override
  String get branchId;
  @override
  double get total;
  @override
  String get status;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of SaleDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaleDocumentImplCopyWith<_$SaleDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
