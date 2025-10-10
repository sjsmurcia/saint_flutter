import '../../domain/models/company.dart';
import '../../domain/repositories/company_repository.dart';
import '../remote/mock_catalog_api.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  CompanyRepositoryImpl(this._api);

  final MockCatalogApi _api;

  @override
  Future<List<Company>> loadCompanies(String tenantId) async {
    final data = await _api.fetchCompanies(tenantId: tenantId);
    return data
        .map(
          (raw) => Company(
            id: raw['id'] as String,
            name: raw['name'] as String,
            branches: (raw['branches'] as List<dynamic>)
                .map(
                  (branch) => Branch(
                    id: branch['id'] as String,
                    name: branch['name'] as String,
                  ),
                )
                .toList(),
          ),
        )
        .toList();
  }
}
