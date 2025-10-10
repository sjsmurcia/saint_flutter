import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/company.dart';

part 'company_selection_state.freezed.dart';

@freezed
class CompanySelectionState with _$CompanySelectionState {
  const factory CompanySelectionState({
    @Default(false) bool isLoading,
    @Default(<Company>[]) List<Company> companies,
    Company? selectedCompany,
    Branch? selectedBranch,
    String? error,
  }) = _CompanySelectionState;
}
