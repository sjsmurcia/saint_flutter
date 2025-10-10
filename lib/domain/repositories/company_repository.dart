import '../models/company.dart';

abstract class CompanyRepository {
  Future<List<Company>> loadCompanies(String tenantId);
}
