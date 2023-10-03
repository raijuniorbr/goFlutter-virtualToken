import 'package:virtualtoken/models/company_account.dart';

abstract class ICompanyAccountRepository {
  Future<List<CompanyAccount>> getAll();
  Future<CompanyAccount?> getOne(int id);
  Future<void> insert(CompanyAccount companyAccount);
  Future<void> update(CompanyAccount companyAccount);
  Future<void> delete(int id);
}
