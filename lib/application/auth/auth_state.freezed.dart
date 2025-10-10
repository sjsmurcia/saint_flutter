// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loading,
    required TResult Function(UserSession session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loading,
    TResult? Function(UserSession session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loading,
    TResult Function(UserSession session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateUnknown value) unknown,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateUnknown value)? unknown,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateUnknown value)? unknown,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AuthStateUnknownImplCopyWith<$Res> {
  factory _$$AuthStateUnknownImplCopyWith(
    _$AuthStateUnknownImpl value,
    $Res Function(_$AuthStateUnknownImpl) then,
  ) = __$$AuthStateUnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateUnknownImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateUnknownImpl>
    implements _$$AuthStateUnknownImplCopyWith<$Res> {
  __$$AuthStateUnknownImplCopyWithImpl(
    _$AuthStateUnknownImpl _value,
    $Res Function(_$AuthStateUnknownImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateUnknownImpl implements AuthStateUnknown {
  const _$AuthStateUnknownImpl();

  @override
  String toString() {
    return 'AuthState.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateUnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loading,
    required TResult Function(UserSession session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loading,
    TResult? Function(UserSession session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loading,
    TResult Function(UserSession session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateUnknown value) unknown,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateError value) error,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateUnknown value)? unknown,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateError value)? error,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateUnknown value)? unknown,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class AuthStateUnknown implements AuthState {
  const factory AuthStateUnknown() = _$AuthStateUnknownImpl;
}

/// @nodoc
abstract class _$$AuthStateLoadingImplCopyWith<$Res> {
  factory _$$AuthStateLoadingImplCopyWith(
    _$AuthStateLoadingImpl value,
    $Res Function(_$AuthStateLoadingImpl) then,
  ) = __$$AuthStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateLoadingImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateLoadingImpl>
    implements _$$AuthStateLoadingImplCopyWith<$Res> {
  __$$AuthStateLoadingImplCopyWithImpl(
    _$AuthStateLoadingImpl _value,
    $Res Function(_$AuthStateLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateLoadingImpl implements AuthStateLoading {
  const _$AuthStateLoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AuthStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loading,
    required TResult Function(UserSession session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loading,
    TResult? Function(UserSession session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loading,
    TResult Function(UserSession session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateUnknown value) unknown,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateUnknown value)? unknown,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateUnknown value)? unknown,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthStateLoading implements AuthState {
  const factory AuthStateLoading() = _$AuthStateLoadingImpl;
}

/// @nodoc
abstract class _$$AuthStateAuthenticatedImplCopyWith<$Res> {
  factory _$$AuthStateAuthenticatedImplCopyWith(
    _$AuthStateAuthenticatedImpl value,
    $Res Function(_$AuthStateAuthenticatedImpl) then,
  ) = __$$AuthStateAuthenticatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSession session});

  $UserSessionCopyWith<$Res> get session;
}

/// @nodoc
class __$$AuthStateAuthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateAuthenticatedImpl>
    implements _$$AuthStateAuthenticatedImplCopyWith<$Res> {
  __$$AuthStateAuthenticatedImplCopyWithImpl(
    _$AuthStateAuthenticatedImpl _value,
    $Res Function(_$AuthStateAuthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? session = null}) {
    return _then(
      _$AuthStateAuthenticatedImpl(
        null == session
            ? _value.session
            : session // ignore: cast_nullable_to_non_nullable
                  as UserSession,
      ),
    );
  }

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserSessionCopyWith<$Res> get session {
    return $UserSessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value));
    });
  }
}

/// @nodoc

class _$AuthStateAuthenticatedImpl implements AuthStateAuthenticated {
  const _$AuthStateAuthenticatedImpl(this.session);

  @override
  final UserSession session;

  @override
  String toString() {
    return 'AuthState.authenticated(session: $session)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateAuthenticatedImpl &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, session);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateAuthenticatedImplCopyWith<_$AuthStateAuthenticatedImpl>
  get copyWith =>
      __$$AuthStateAuthenticatedImplCopyWithImpl<_$AuthStateAuthenticatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loading,
    required TResult Function(UserSession session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return authenticated(session);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loading,
    TResult? Function(UserSession session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return authenticated?.call(session);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loading,
    TResult Function(UserSession session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(session);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateUnknown value) unknown,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateError value) error,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateUnknown value)? unknown,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateError value)? error,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateUnknown value)? unknown,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class AuthStateAuthenticated implements AuthState {
  const factory AuthStateAuthenticated(final UserSession session) =
      _$AuthStateAuthenticatedImpl;

  UserSession get session;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateAuthenticatedImplCopyWith<_$AuthStateAuthenticatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthStateUnauthenticatedImplCopyWith<$Res> {
  factory _$$AuthStateUnauthenticatedImplCopyWith(
    _$AuthStateUnauthenticatedImpl value,
    $Res Function(_$AuthStateUnauthenticatedImpl) then,
  ) = __$$AuthStateUnauthenticatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthStateUnauthenticatedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateUnauthenticatedImpl>
    implements _$$AuthStateUnauthenticatedImplCopyWith<$Res> {
  __$$AuthStateUnauthenticatedImplCopyWithImpl(
    _$AuthStateUnauthenticatedImpl _value,
    $Res Function(_$AuthStateUnauthenticatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AuthStateUnauthenticatedImpl implements AuthStateUnauthenticated {
  const _$AuthStateUnauthenticatedImpl();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateUnauthenticatedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loading,
    required TResult Function(UserSession session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loading,
    TResult? Function(UserSession session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loading,
    TResult Function(UserSession session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateUnknown value) unknown,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateError value) error,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateUnknown value)? unknown,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateError value)? error,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateUnknown value)? unknown,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class AuthStateUnauthenticated implements AuthState {
  const factory AuthStateUnauthenticated() = _$AuthStateUnauthenticatedImpl;
}

/// @nodoc
abstract class _$$AuthStateErrorImplCopyWith<$Res> {
  factory _$$AuthStateErrorImplCopyWith(
    _$AuthStateErrorImpl value,
    $Res Function(_$AuthStateErrorImpl) then,
  ) = __$$AuthStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AuthStateErrorImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateErrorImpl>
    implements _$$AuthStateErrorImplCopyWith<$Res> {
  __$$AuthStateErrorImplCopyWithImpl(
    _$AuthStateErrorImpl _value,
    $Res Function(_$AuthStateErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AuthStateErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateErrorImpl implements AuthStateError {
  const _$AuthStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      __$$AuthStateErrorImplCopyWithImpl<_$AuthStateErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unknown,
    required TResult Function() loading,
    required TResult Function(UserSession session) authenticated,
    required TResult Function() unauthenticated,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? unknown,
    TResult? Function()? loading,
    TResult? Function(UserSession session)? authenticated,
    TResult? Function()? unauthenticated,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unknown,
    TResult Function()? loading,
    TResult Function(UserSession session)? authenticated,
    TResult Function()? unauthenticated,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AuthStateUnknown value) unknown,
    required TResult Function(AuthStateLoading value) loading,
    required TResult Function(AuthStateAuthenticated value) authenticated,
    required TResult Function(AuthStateUnauthenticated value) unauthenticated,
    required TResult Function(AuthStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AuthStateUnknown value)? unknown,
    TResult? Function(AuthStateLoading value)? loading,
    TResult? Function(AuthStateAuthenticated value)? authenticated,
    TResult? Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult? Function(AuthStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AuthStateUnknown value)? unknown,
    TResult Function(AuthStateLoading value)? loading,
    TResult Function(AuthStateAuthenticated value)? authenticated,
    TResult Function(AuthStateUnauthenticated value)? unauthenticated,
    TResult Function(AuthStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthStateError implements AuthState {
  const factory AuthStateError(final String message) = _$AuthStateErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateErrorImplCopyWith<_$AuthStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
