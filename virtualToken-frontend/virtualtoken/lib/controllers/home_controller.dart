import 'package:virtualtoken/db/virtual_db.dart';
import 'package:virtualtoken/repositories/company_account_token.dart';
import 'package:virtualtoken/models/company_account_token.dart';

class HomeController {
  final CompanyAccountRepository _accountRepo = CompanyAccountRepository(VirtualDB());

  /// Accounts
  ///
  Future<List<CompanyAccountToken>> getAllCpnyAccounts() {
    return _accountRepo.getAll();
  }

  Future<void> addCpnyAccount(CompanyAccountToken account) {
    return _accountRepo.insert(account);
  }

  Future<void> removeCpnyAccount(int id) {
    return _accountRepo.delete(id);
  }
}
