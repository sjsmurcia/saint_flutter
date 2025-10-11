// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'license_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

LicenseInfo _$LicenseInfoFromJson(Map<String, dynamic> json) {
  return _LicenseInfo.fromJson(json);
}

/// @nodoc
mixin _$LicenseInfo {
  String get token => throw _privateConstructorUsedError;
  String get licenseId => throw _privateConstructorUsedError;
  String get tenantId => throw _privateConstructorUsedError;
  String get licenseType => throw _privateConstructorUsedError;
  List<String> get entitlements => throw _privateConstructorUsedError;
  DateTime get issuedAt => throw _privateConstructorUsedError;
  DateTime get expiresAt => throw _privateConstructorUsedError;
  DateTime get lastCheckInAt => throw _privateConstructorUsedError;
  int get checkIntervalDays => throw _privateConstructorUsedError;
  int get graceDays => throw _privateConstructorUsedError;

  /// Serializes this LicenseInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LicenseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LicenseInfoCopyWith<LicenseInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LicenseInfoCopyWith<$Res> {
  factory $LicenseInfoCopyWith(
    LicenseInfo value,
    $Res Function(LicenseInfo) then,
  ) = _$LicenseInfoCopyWithImpl<$Res, LicenseInfo>;
  @useResult
  $Res call({
    String token,
    String licenseId,
    String tenantId,
    String licenseType,
    List<String> entitlements,
    DateTime issuedAt,
    DateTime expiresAt,
    DateTime lastCheckInAt,
    int checkIntervalDays,
    int graceDays,
  });
}

/// @nodoc
class _$LicenseInfoCopyWithImpl<$Res, $Val extends LicenseInfo>
    implements $LicenseInfoCopyWith<$Res> {
  _$LicenseInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LicenseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? licenseId = null,
    Object? tenantId = null,
    Object? licenseType = null,
    Object? entitlements = null,
    Object? issuedAt = null,
    Object? expiresAt = null,
    Object? lastCheckInAt = null,
    Object? checkIntervalDays = null,
    Object? graceDays = null,
  }) {
    return _then(
      _value.copyWith(
            token: null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                      as String,
            licenseId: null == licenseId
                ? _value.licenseId
                : licenseId // ignore: cast_nullable_to_non_nullable
                      as String,
            tenantId: null == tenantId
                ? _value.tenantId
                : tenantId // ignore: cast_nullable_to_non_nullable
                      as String,
            licenseType: null == licenseType
                ? _value.licenseType
                : licenseType // ignore: cast_nullable_to_non_nullable
                      as String,
            entitlements: null == entitlements
                ? _value.entitlements
                : entitlements // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            issuedAt: null == issuedAt
                ? _value.issuedAt
                : issuedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            expiresAt: null == expiresAt
                ? _value.expiresAt
                : expiresAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastCheckInAt: null == lastCheckInAt
                ? _value.lastCheckInAt
                : lastCheckInAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            checkIntervalDays: null == checkIntervalDays
                ? _value.checkIntervalDays
                : checkIntervalDays // ignore: cast_nullable_to_non_nullable
                      as int,
            graceDays: null == graceDays
                ? _value.graceDays
                : graceDays // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LicenseInfoImplCopyWith<$Res>
    implements $LicenseInfoCopyWith<$Res> {
  factory _$$LicenseInfoImplCopyWith(
    _$LicenseInfoImpl value,
    $Res Function(_$LicenseInfoImpl) then,
  ) = __$$LicenseInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String token,
    String licenseId,
    String tenantId,
    String licenseType,
    List<String> entitlements,
    DateTime issuedAt,
    DateTime expiresAt,
    DateTime lastCheckInAt,
    int checkIntervalDays,
    int graceDays,
  });
}

/// @nodoc
class __$$LicenseInfoImplCopyWithImpl<$Res>
    extends _$LicenseInfoCopyWithImpl<$Res, _$LicenseInfoImpl>
    implements _$$LicenseInfoImplCopyWith<$Res> {
  __$$LicenseInfoImplCopyWithImpl(
    _$LicenseInfoImpl _value,
    $Res Function(_$LicenseInfoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LicenseInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? licenseId = null,
    Object? tenantId = null,
    Object? licenseType = null,
    Object? entitlements = null,
    Object? issuedAt = null,
    Object? expiresAt = null,
    Object? lastCheckInAt = null,
    Object? checkIntervalDays = null,
    Object? graceDays = null,
  }) {
    return _then(
      _$LicenseInfoImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        licenseId: null == licenseId
            ? _value.licenseId
            : licenseId // ignore: cast_nullable_to_non_nullable
                  as String,
        tenantId: null == tenantId
            ? _value.tenantId
            : tenantId // ignore: cast_nullable_to_non_nullable
                  as String,
        licenseType: null == licenseType
            ? _value.licenseType
            : licenseType // ignore: cast_nullable_to_non_nullable
                  as String,
        entitlements: null == entitlements
            ? _value._entitlements
            : entitlements // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        issuedAt: null == issuedAt
            ? _value.issuedAt
            : issuedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        expiresAt: null == expiresAt
            ? _value.expiresAt
            : expiresAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastCheckInAt: null == lastCheckInAt
            ? _value.lastCheckInAt
            : lastCheckInAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        checkIntervalDays: null == checkIntervalDays
            ? _value.checkIntervalDays
            : checkIntervalDays // ignore: cast_nullable_to_non_nullable
                  as int,
        graceDays: null == graceDays
            ? _value.graceDays
            : graceDays // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LicenseInfoImpl implements _LicenseInfo {
  const _$LicenseInfoImpl({
    required this.token,
    required this.licenseId,
    required this.tenantId,
    required this.licenseType,
    required final List<String> entitlements,
    required this.issuedAt,
    required this.expiresAt,
    required this.lastCheckInAt,
    required this.checkIntervalDays,
    required this.graceDays,
  }) : _entitlements = entitlements;

  factory _$LicenseInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LicenseInfoImplFromJson(json);

  @override
  final String token;
  @override
  final String licenseId;
  @override
  final String tenantId;
  @override
  final String licenseType;
  final List<String> _entitlements;
  @override
  List<String> get entitlements {
    if (_entitlements is EqualUnmodifiableListView) return _entitlements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entitlements);
  }

  @override
  final DateTime issuedAt;
  @override
  final DateTime expiresAt;
  @override
  final DateTime lastCheckInAt;
  @override
  final int checkIntervalDays;
  @override
  final int graceDays;

  @override
  String toString() {
    return 'LicenseInfo(token: $token, licenseId: $licenseId, tenantId: $tenantId, licenseType: $licenseType, entitlements: $entitlements, issuedAt: $issuedAt, expiresAt: $expiresAt, lastCheckInAt: $lastCheckInAt, checkIntervalDays: $checkIntervalDays, graceDays: $graceDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LicenseInfoImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.licenseId, licenseId) ||
                other.licenseId == licenseId) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.licenseType, licenseType) ||
                other.licenseType == licenseType) &&
            const DeepCollectionEquality().equals(
              other._entitlements,
              _entitlements,
            ) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.lastCheckInAt, lastCheckInAt) ||
                other.lastCheckInAt == lastCheckInAt) &&
            (identical(other.checkIntervalDays, checkIntervalDays) ||
                other.checkIntervalDays == checkIntervalDays) &&
            (identical(other.graceDays, graceDays) ||
                other.graceDays == graceDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    token,
    licenseId,
    tenantId,
    licenseType,
    const DeepCollectionEquality().hash(_entitlements),
    issuedAt,
    expiresAt,
    lastCheckInAt,
    checkIntervalDays,
    graceDays,
  );

  /// Create a copy of LicenseInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LicenseInfoImplCopyWith<_$LicenseInfoImpl> get copyWith =>
      __$$LicenseInfoImplCopyWithImpl<_$LicenseInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LicenseInfoImplToJson(this);
  }
}

abstract class _LicenseInfo implements LicenseInfo {
  const factory _LicenseInfo({
    required final String token,
    required final String licenseId,
    required final String tenantId,
    required final String licenseType,
    required final List<String> entitlements,
    required final DateTime issuedAt,
    required final DateTime expiresAt,
    required final DateTime lastCheckInAt,
    required final int checkIntervalDays,
    required final int graceDays,
  }) = _$LicenseInfoImpl;

  factory _LicenseInfo.fromJson(Map<String, dynamic> json) =
      _$LicenseInfoImpl.fromJson;

  @override
  String get token;
  @override
  String get licenseId;
  @override
  String get tenantId;
  @override
  String get licenseType;
  @override
  List<String> get entitlements;
  @override
  DateTime get issuedAt;
  @override
  DateTime get expiresAt;
  @override
  DateTime get lastCheckInAt;
  @override
  int get checkIntervalDays;
  @override
  int get graceDays;

  /// Create a copy of LicenseInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LicenseInfoImplCopyWith<_$LicenseInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
