import 'package:virtualtoken/db/virtual_db.dart';
import 'package:virtualtoken/repositories/company_account_interface.dart';
import 'package:virtualtoken/models/company_account_token.dart';

class CompanyAccountRepository implements ICompanyAccountRepository {
  final VirtualDB _db;

  CompanyAccountRepository(this._db);

  @override
  Future<List<CompanyAccountToken>> getAll() async {
    var accounts = await _db.listJson();
    //return accounts.map((account) => CompanyAccount.fromMap(account)).toList();
    return accounts;
  }

  @override
  Future<CompanyAccountToken?> getOne(int id) async {
    var account = await _db.findOne(id);
    //return account != null ? CompanyAccount.fromMap(account) : null;
    return account;
  }

  @override
  Future<void> insert(CompanyAccountToken account) async {
    //await _db.insert(account.toMap());
    await _db.insert(account);
  }

  @override
  Future<void> update(CompanyAccountToken account) async {
    //await _db.update(account.toMap());
    await _db.update(account);
  }

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }
}
