// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ReportDocument _$ReportDocumentFromJson(Map<String, dynamic> json) {
  return _ReportDocument.fromJson(json);
}

/// @nodoc
mixin _$ReportDocument {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  DateTime get downloadedAt => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String? get referenceId => throw _privateConstructorUsedError;
  String? get contentType => throw _privateConstructorUsedError;

  /// Serializes this ReportDocument to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReportDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReportDocumentCopyWith<ReportDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDocumentCopyWith<$Res> {
  factory $ReportDocumentCopyWith(
    ReportDocument value,
    $Res Function(ReportDocument) then,
  ) = _$ReportDocumentCopyWithImpl<$Res, ReportDocument>;
  @useResult
  $Res call({
    String id,
    String name,
    String path,
    DateTime downloadedAt,
    String type,
    String? referenceId,
    String? contentType,
  });
}

/// @nodoc
class _$ReportDocumentCopyWithImpl<$Res, $Val extends ReportDocument>
    implements $ReportDocumentCopyWith<$Res> {
  _$ReportDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReportDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? downloadedAt = null,
    Object? type = null,
    Object? referenceId = freezed,
    Object? contentType = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            path: null == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String,
            downloadedAt: null == downloadedAt
                ? _value.downloadedAt
                : downloadedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String,
            referenceId: freezed == referenceId
                ? _value.referenceId
                : referenceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            contentType: freezed == contentType
                ? _value.contentType
                : contentType // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ReportDocumentImplCopyWith<$Res>
    implements $ReportDocumentCopyWith<$Res> {
  factory _$$ReportDocumentImplCopyWith(
    _$ReportDocumentImpl value,
    $Res Function(_$ReportDocumentImpl) then,
  ) = __$$ReportDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String path,
    DateTime downloadedAt,
    String type,
    String? referenceId,
    String? contentType,
  });
}

/// @nodoc
class __$$ReportDocumentImplCopyWithImpl<$Res>
    extends _$ReportDocumentCopyWithImpl<$Res, _$ReportDocumentImpl>
    implements _$$ReportDocumentImplCopyWith<$Res> {
  __$$ReportDocumentImplCopyWithImpl(
    _$ReportDocumentImpl _value,
    $Res Function(_$ReportDocumentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReportDocument
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? path = null,
    Object? downloadedAt = null,
    Object? type = null,
    Object? referenceId = freezed,
    Object? contentType = freezed,
  }) {
    return _then(
      _$ReportDocumentImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        path: null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
        downloadedAt: null == downloadedAt
            ? _value.downloadedAt
            : downloadedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String,
        referenceId: freezed == referenceId
            ? _value.referenceId
            : referenceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        contentType: freezed == contentType
            ? _value.contentType
            : contentType // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportDocumentImpl implements _ReportDocument {
  const _$ReportDocumentImpl({
    required this.id,
    required this.name,
    required this.path,
    required this.downloadedAt,
    required this.type,
    this.referenceId,
    this.contentType,
  });

  factory _$ReportDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportDocumentImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;
  @override
  final DateTime downloadedAt;
  @override
  final String type;
  @override
  final String? referenceId;
  @override
  final String? contentType;

  @override
  String toString() {
    return 'ReportDocument(id: $id, name: $name, path: $path, downloadedAt: $downloadedAt, type: $type, referenceId: $referenceId, contentType: $contentType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.downloadedAt, downloadedAt) ||
                other.downloadedAt == downloadedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.referenceId, referenceId) ||
                other.referenceId == referenceId) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    path,
    downloadedAt,
    type,
    referenceId,
    contentType,
  );

  /// Create a copy of ReportDocument
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportDocumentImplCopyWith<_$ReportDocumentImpl> get copyWith =>
      __$$ReportDocumentImplCopyWithImpl<_$ReportDocumentImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportDocumentImplToJson(this);
  }
}

abstract class _ReportDocument implements ReportDocument {
  const factory _ReportDocument({
    required final String id,
    required final String name,
    required final String path,
    required final DateTime downloadedAt,
    required final String type,
    final String? referenceId,
    final String? contentType,
  }) = _$ReportDocumentImpl;

  factory _ReportDocument.fromJson(Map<String, dynamic> json) =
      _$ReportDocumentImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
  @override
  DateTime get downloadedAt;
  @override
  String get type;
  @override
  String? get referenceId;
  @override
  String? get contentType;

  /// Create a copy of ReportDocument
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReportDocumentImplCopyWith<_$ReportDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
