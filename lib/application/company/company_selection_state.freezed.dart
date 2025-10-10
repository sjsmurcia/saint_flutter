// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CompanySelectionState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Company> get companies => throw _privateConstructorUsedError;
  Company? get selectedCompany => throw _privateConstructorUsedError;
  Branch? get selectedBranch => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of CompanySelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanySelectionStateCopyWith<CompanySelectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanySelectionStateCopyWith<$Res> {
  factory $CompanySelectionStateCopyWith(
    CompanySelectionState value,
    $Res Function(CompanySelectionState) then,
  ) = _$CompanySelectionStateCopyWithImpl<$Res, CompanySelectionState>;
  @useResult
  $Res call({
    bool isLoading,
    List<Company> companies,
    Company? selectedCompany,
    Branch? selectedBranch,
    String? error,
  });

  $CompanyCopyWith<$Res>? get selectedCompany;
  $BranchCopyWith<$Res>? get selectedBranch;
}

/// @nodoc
class _$CompanySelectionStateCopyWithImpl<
  $Res,
  $Val extends CompanySelectionState
>
    implements $CompanySelectionStateCopyWith<$Res> {
  _$CompanySelectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CompanySelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? companies = null,
    Object? selectedCompany = freezed,
    Object? selectedBranch = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            companies: null == companies
                ? _value.companies
                : companies // ignore: cast_nullable_to_non_nullable
                      as List<Company>,
            selectedCompany: freezed == selectedCompany
                ? _value.selectedCompany
                : selectedCompany // ignore: cast_nullable_to_non_nullable
                      as Company?,
            selectedBranch: freezed == selectedBranch
                ? _value.selectedBranch
                : selectedBranch // ignore: cast_nullable_to_non_nullable
                      as Branch?,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of CompanySelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res>? get selectedCompany {
    if (_value.selectedCompany == null) {
      return null;
    }

    return $CompanyCopyWith<$Res>(_value.selectedCompany!, (value) {
      return _then(_value.copyWith(selectedCompany: value) as $Val);
    });
  }

  /// Create a copy of CompanySelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BranchCopyWith<$Res>? get selectedBranch {
    if (_value.selectedBranch == null) {
      return null;
    }

    return $BranchCopyWith<$Res>(_value.selectedBranch!, (value) {
      return _then(_value.copyWith(selectedBranch: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanySelectionStateImplCopyWith<$Res>
    implements $CompanySelectionStateCopyWith<$Res> {
  factory _$$CompanySelectionStateImplCopyWith(
    _$CompanySelectionStateImpl value,
    $Res Function(_$CompanySelectionStateImpl) then,
  ) = __$$CompanySelectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    List<Company> companies,
    Company? selectedCompany,
    Branch? selectedBranch,
    String? error,
  });

  @override
  $CompanyCopyWith<$Res>? get selectedCompany;
  @override
  $BranchCopyWith<$Res>? get selectedBranch;
}

/// @nodoc
class __$$CompanySelectionStateImplCopyWithImpl<$Res>
    extends
        _$CompanySelectionStateCopyWithImpl<$Res, _$CompanySelectionStateImpl>
    implements _$$CompanySelectionStateImplCopyWith<$Res> {
  __$$CompanySelectionStateImplCopyWithImpl(
    _$CompanySelectionStateImpl _value,
    $Res Function(_$CompanySelectionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CompanySelectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? companies = null,
    Object? selectedCompany = freezed,
    Object? selectedBranch = freezed,
    Object? error = freezed,
  }) {
    return _then(
      _$CompanySelectionStateImpl(
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        companies: null == companies
            ? _value._companies
            : companies // ignore: cast_nullable_to_non_nullable
                  as List<Company>,
        selectedCompany: freezed == selectedCompany
            ? _value.selectedCompany
            : selectedCompany // ignore: cast_nullable_to_non_nullable
                  as Company?,
        selectedBranch: freezed == selectedBranch
            ? _value.selectedBranch
            : selectedBranch // ignore: cast_nullable_to_non_nullable
                  as Branch?,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$CompanySelectionStateImpl implements _CompanySelectionState {
  const _$CompanySelectionStateImpl({
    this.isLoading = false,
    final List<Company> companies = const <Company>[],
    this.selectedCompany,
    this.selectedBranch,
    this.error,
  }) : _companies = companies;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Company> _companies;
  @override
  @JsonKey()
  List<Company> get companies {
    if (_companies is EqualUnmodifiableListView) return _companies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_companies);
  }

  @override
  final Company? selectedCompany;
  @override
  final Branch? selectedBranch;
  @override
  final String? error;

  @override
  String toString() {
    return 'CompanySelectionState(isLoading: $isLoading, companies: $companies, selectedCompany: $selectedCompany, selectedBranch: $selectedBranch, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanySelectionStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(
              other._companies,
              _companies,
            ) &&
            (identical(other.selectedCompany, selectedCompany) ||
                other.selectedCompany == selectedCompany) &&
            (identical(other.selectedBranch, selectedBranch) ||
                other.selectedBranch == selectedBranch) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    const DeepCollectionEquality().hash(_companies),
    selectedCompany,
    selectedBranch,
    error,
  );

  /// Create a copy of CompanySelectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanySelectionStateImplCopyWith<_$CompanySelectionStateImpl>
  get copyWith =>
      __$$CompanySelectionStateImplCopyWithImpl<_$CompanySelectionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CompanySelectionState implements CompanySelectionState {
  const factory _CompanySelectionState({
    final bool isLoading,
    final List<Company> companies,
    final Company? selectedCompany,
    final Branch? selectedBranch,
    final String? error,
  }) = _$CompanySelectionStateImpl;

  @override
  bool get isLoading;
  @override
  List<Company> get companies;
  @override
  Company? get selectedCompany;
  @override
  Branch? get selectedBranch;
  @override
  String? get error;

  /// Create a copy of CompanySelectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanySelectionStateImplCopyWith<_$CompanySelectionStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
