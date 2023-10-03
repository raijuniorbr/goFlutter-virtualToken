import 'dart:math';

class VirtualDB {
  List<Map<String, dynamic>> _accounts = [];
  static final VirtualDB _db = VirtualDB._privateConstructor();

  VirtualDB._privateConstructor();

  factory VirtualDB() {
    return _db;
  }

  Future<void> insert(Map<String, dynamic> account) async {
    account['id'] = Random().nextInt(1000);
    _accounts.add(account);
  }

  Future<void> remove(int id) async {
    _accounts.removeWhere((account) => account['id'] == id);
  }

  Future<void> update(Map<String, dynamic> updatedAccount) async {
    int i = _accounts.indexWhere((account) => account['id'] == updatedAccount['id']);
    _accounts[i] = updatedAccount;
  }

  Future<List<Map<String, dynamic>>> list() async {
    await Future.delayed(Duration(milliseconds: 800));
    return _accounts;
  }

  Future<Map<String, dynamic>?> findOne(int id) async {
    return _accounts.firstWhere((account) => account['id'] == id);
  }
}
