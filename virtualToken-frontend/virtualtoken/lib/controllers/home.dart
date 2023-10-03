import 'package:virtualtoken/db/virtual_db.dart';
import 'package:virtualtoken/repositories/company_account.dart';
import 'package:virtualtoken/models/company_account.dart';

class HomeController {
  CompanyAccountRepository _accountRepo = CompanyAccountRepository(VirtualDB());

  Future<List<CompanyAccount>> getAllCpnyAccounts() {
    return _accountRepo.getAll();
  }

  Future<void> addCpnyAccount(CompanyAccount account) {
    return _accountRepo.insert(account);
  }

  Future<void> removeCpnyAccount(int id) {
    return _accountRepo.delete(id);
  }
}
