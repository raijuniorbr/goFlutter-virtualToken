//import 'package:virtualtoken/db/virtual_db.dart';
//import 'package:virtualtoken/repositories/company_account_token.dart';
//import 'package:virtualtoken/models/company_account_token.dart';
import 'dart:convert';
import 'package:virtualtoken/db/virtual_token_db.dart';
import 'package:virtualtoken/repositories/device_token.dart';
import 'package:virtualtoken/models/device_token.dart';
import '../common/globalvars.dart' as globals;

class HomeController {
  //final CompanyAccountRepository _accountRepo = CompanyAccountRepository(VirtualDB());
  final DeviceTokenRepository _deviceTokensRepo = DeviceTokenRepository(VirtualTokenDB());

  /// Accounts
  ///
/*
  Future<List<CompanyAccountToken>> getAllCpnyAccounts() {
    return _accountRepo.getAll();
  }

  Future<void> addCpnyAccount(CompanyAccountToken account) {
    return _accountRepo.insert(account);
  }

  Future<void> removeCpnyAccount(int id) {
    return _accountRepo.delete(id);
  }
*/

  /// DeviceTokens
  ///
  Future<List<DeviceToken>> getAllDeviceTokens() {
    return _deviceTokensRepo.getAll();
  }

  Future<void> addDeviceTokens(DeviceToken deviceToken) {
    return _deviceTokensRepo.insert(deviceToken);
  }

  Future<void> removeDeviceTokens(String id) {
    return _deviceTokensRepo.delete(id);
  }

  // método interno para gerar novo token a cada período
  List<DeviceToken>? getToken([int interruptor = 0, List<DeviceToken>? devtoken]) {
    if (interruptor == 1) {
      // Loop para gerar um token virtual para cada elemento
      for (var i = 0; i < devtoken!.length; i++) {
        devtoken[i].virtualTotp = devtoken[i].getSecret();
      }
    }
    return devtoken;
  }

  List<DeviceToken> getAllDeviceTokensSync() {
    return _deviceTokensRepo.getAllSync();
  }
}
