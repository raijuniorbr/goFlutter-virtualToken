import 'dart:math';
import 'package:dio/dio.dart';
import 'package:virtualtoken/models/company_account.dart';

class VirtualDB {
  final String _accounts_URL = 'http://MacBookRaiJr.local:5000/accounts';
  List<CompanyAccount> _accounts = [];
  static final VirtualDB _db = VirtualDB._privateConstructor();
  final Dio dio = Dio();

  bool primeiraVez = true;

  VirtualDB._privateConstructor();

  factory VirtualDB() {
    return _db;
  }

  Future<void> insert(CompanyAccount account) async {
    account.id = Random().nextInt(1000);
    _accounts.add(account);
  }

  Future<void> remove(int id) async {
    _accounts.removeWhere((account) => account.id == id);
  }

  Future<void> update(CompanyAccount updatedAccount) async {
    int i = _accounts.indexWhere((account) => account.id == updatedAccount.id);
    _accounts[i] = updatedAccount;
  }

  Future<List<CompanyAccount>> listJson() async {
    if (primeiraVez) {
      primeiraVez = false;
      late List<CompanyAccount> accountsFromJson = [];
      try {
        final res = await dio.get(_accounts_URL);
        accountsFromJson = res.data['accounts']
            .map<CompanyAccount>(
              (account) => CompanyAccount.fromJson(account),
            )
            .toList();
        _accounts.addAll(accountsFromJson);
      } on DioException catch (e) {
        accountsFromJson = [];
        _accounts = [];
      }
    } else {}
    return _accounts;
  }

  Future<List<CompanyAccount>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _accounts;
  }

  Future<CompanyAccount?> findOne(int id) async {
    return _accounts.firstWhere((account) => account.id == id);
  }
}
