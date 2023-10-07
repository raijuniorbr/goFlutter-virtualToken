import 'package:virtualtoken/models/company_account_token.dart';

abstract class ICompanyAccountRepository {
  Future<List<CompanyAccountToken>> getAll();
  Future<CompanyAccountToken?> getOne(int id);
  Future<void> insert(CompanyAccountToken companyAccount);
  Future<void> update(CompanyAccountToken companyAccount);
  Future<void> delete(int id);
}
