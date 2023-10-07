import 'package:virtualtoken/db/virtual_token_db.dart';
import 'package:virtualtoken/repositories/device_token_interface.dart';
import 'package:virtualtoken/models/device_token.dart';
import '../common/globalvars.dart' as globals;

class DeviceTokenRepository implements IDeviceTokenRepository {
  final VirtualTokenDB _db;

  DeviceTokenRepository(this._db);

  @override
  Future<List<DeviceToken>> getAll() async {
    var deviceTokens = await _db.listDeviceTokens();
    //return accounts.map((account) => CompanyAccount.fromMap(account)).toList();
    return deviceTokens;
  }

  @override
  Future<DeviceToken?> getOne(String id) async {
    var deviceToken = await _db.findOne(id);
    //return account != null ? CompanyAccount.fromMap(account) : null;
    return deviceToken;
  }

  @override
  Future<void> insert(DeviceToken deviceToken) async {
    //await _db.insert(account.toMap());
    await _db.insert(deviceToken);
  }

  @override
  Future<void> update(DeviceToken deviceToken) async {
    //await _db.update(account.toMap());
    await _db.update(deviceToken);
  }

  @override
  Future<void> delete(String id) async {
    await _db.remove(id);
  }

  @override
  List<DeviceToken> getAllSync() {
    return _db.listFromJson(globals.jsonTokens!);
  }
}
