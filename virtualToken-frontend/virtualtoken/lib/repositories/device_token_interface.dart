import 'package:virtualtoken/models/device_token.dart';

abstract class IDeviceTokenRepository {
  Future<List<DeviceToken>> getAll();
  Future<DeviceToken?> getOne(String id);
  Future<void> insert(DeviceToken deviceToken);
  Future<void> update(DeviceToken deviceToken);
  Future<void> delete(String id);
  List<DeviceToken> getAllSync();
}
