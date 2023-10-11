import 'package:virtualtoken/db/virtual_token_db.dart';
import 'package:virtualtoken/repositories/device_token.dart';
import 'package:virtualtoken/models/device_token.dart';
import '../common/globalvars.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

class DeviceTokenController {
  final DeviceTokenRepository _deviceTokensRepo = DeviceTokenRepository(VirtualTokenDB());

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

  Future<SharedPreferences> loadSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();

    // Para debugar... globals.debug == true
    // Irá resetar o token:
    if (globals.mockReset || prefs.getStringList('tokens') == null || prefs.getStringList('tokens').toString() == '[]') {
      globals.mockReset = false;
      List<String>? tokens = prefs.getStringList('tokens');

      if (globals.mockPopListTokens) {
        //addTokenOnDevice(globals.jsonTokensDefault);
        tokens = [globals.jsonTokenMock];
        prefs.setStringList('tokens', tokens);
      } else {
        //tokens = [globals.jsonTokensDefault];
        tokens = [''];
        prefs.setStringList('tokens', tokens);
      }
    }

    globals.jsonTokens = prefs.getStringList('tokens')?[0];
    // Logs
    //globals.logsCCB = prefs.getStringList('logs')?[0] ?? globals.logsCCBDefault;

    return prefs;
  }
}
