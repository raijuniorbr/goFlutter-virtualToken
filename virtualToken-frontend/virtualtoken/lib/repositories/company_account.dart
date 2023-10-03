import 'package:virtualtoken/db/virtual_db.dart';
import 'package:virtualtoken/repositories/company_account_interface.dart';
import 'package:virtualtoken/models/company_account.dart';

class CompanyAccountRepository implements ICompanyAccountRepository {
  final VirtualDB _db;

  CompanyAccountRepository(this._db);

  @override
  Future<List<CompanyAccount>> getAll() async {
    var accounts = await _db.list();
    return accounts.map((account) => CompanyAccount.fromMap(account)).toList();
  }

  @override
  Future<CompanyAccount?> getOne(int id) async {
    var account = await _db.findOne(id);
    return account != null ? CompanyAccount.fromMap(account) : null;
  }

  @override
  Future<void> insert(CompanyAccount account) async {
    await _db.insert(account.toMap());
  }

  @override
  Future<void> update(CompanyAccount account) async {
    await _db.update(account.toMap());
  }

  @override
  Future<void> delete(int id) async {
    await _db.remove(id);
  }
}
