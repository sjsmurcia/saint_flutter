import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/models/company.dart';
import '../../domain/repositories/company_repository.dart';
import 'company_selection_state.dart';

class CompanySelectionController extends StateNotifier<CompanySelectionState> {
  CompanySelectionController(this._repository, this._storage)
    : super(const CompanySelectionState());

  final CompanyRepository _repository;
  final FlutterSecureStorage _storage;

  String _companyKey(String tenantId) => 'selected_company_$tenantId';
  String _branchKey(String tenantId) => 'selected_branch_$tenantId';

  Future<void> loadForTenant(String tenantId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final companies = await _repository.loadCompanies(tenantId);
      final storedCompanyId = await _storage.read(key: _companyKey(tenantId));
      final storedBranchId = await _storage.read(key: _branchKey(tenantId));

      final selectedCompany =
          _findCompany(companies, storedCompanyId) ??
          (companies.isNotEmpty ? companies.first : null);
      final selectedBranch = selectedCompany != null
          ? _findBranch(selectedCompany.branches, storedBranchId) ??
                (selectedCompany.branches.isNotEmpty
                    ? selectedCompany.branches.first
                    : null)
          : null;

      state = state.copyWith(
        isLoading: false,
        companies: companies,
        selectedCompany: selectedCompany,
        selectedBranch: selectedBranch,
      );
    } catch (error) {
      state = state.copyWith(isLoading: false, error: error.toString());
    }
  }

  Future<void> select({
    required String tenantId,
    required String companyId,
    required String branchId,
  }) async {
    final company = _findCompany(state.companies, companyId);
    if (company == null) {
      return;
    }
    final branch = _findBranch(company.branches, branchId);
    if (branch == null) {
      return;
    }
    state = state.copyWith(selectedCompany: company, selectedBranch: branch);
    await _storage.write(key: _companyKey(tenantId), value: companyId);
    await _storage.write(key: _branchKey(tenantId), value: branchId);
  }

  void reset() {
    state = const CompanySelectionState();
  }

  Company? _findCompany(List<Company> companies, String? id) {
    if (id == null) {
      return null;
    }
    for (final company in companies) {
      if (company.id == id) {
        return company;
      }
    }
    return null;
  }

  Branch? _findBranch(List<Branch> branches, String? id) {
    if (id == null) {
      return null;
    }
    for (final branch in branches) {
      if (branch.id == id) {
        return branch;
      }
    }
    return null;
  }
}
