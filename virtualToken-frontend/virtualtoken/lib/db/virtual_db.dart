import 'dart:math';
import 'package:dio/dio.dart';
import 'package:virtualtoken/models/company_account_token.dart';

class VirtualDB {
  final String _accounts_URL = "http://MacBookRaiJr.local:5000/accounts";
  List<CompanyAccountToken> _accounts = [];
  static final VirtualDB _db = VirtualDB._privateConstructor();
  final Dio dio = Dio();

  bool primeiraVez = true;

  VirtualDB._privateConstructor();

  factory VirtualDB() {
    return _db;
  }

  Future<void> insert(CompanyAccountToken account) async {
    account.id = Random().nextInt(1000);
    _accounts.add(account);
  }

  Future<void> remove(int id) async {
    _accounts.removeWhere((account) => account.id == id);
  }

  Future<void> update(CompanyAccountToken updatedAccount) async {
    int i = _accounts.indexWhere((account) => account.id == updatedAccount.id);
    _accounts[i] = updatedAccount;
  }

  Future<List<CompanyAccountToken>> listJson() async {
    if (primeiraVez) {
      primeiraVez = false;
      late List<CompanyAccountToken> accountsFromJson = [];
      try {
        final res = await dio.get(_accounts_URL);
        accountsFromJson = res.data['accounts']
            .map<CompanyAccountToken>(
              (account) => CompanyAccountToken.fromJson(account),
            )
            .toList();
        _accounts.addAll(accountsFromJson);
      } on DioException {
        accountsFromJson = [];
        _accounts = [];
      }
    } else {}
    return _accounts;
  }

  Future<List<CompanyAccountToken>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _accounts;
  }

  Future<CompanyAccountToken?> findOne(int id) async {
    return _accounts.firstWhere((account) => account.id == id);
  }
}
