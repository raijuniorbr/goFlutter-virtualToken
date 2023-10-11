import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:virtualtoken/models/device_token.dart';

class VirtualTokenDB {
  final String _data_URL = "http://MacBookRaiJr.local:5000/deviceTokens";
  List<DeviceToken> _deviceTokens = [];
  final Dio dio = Dio();
  bool primeiraVez = true;
  static final VirtualTokenDB _db = VirtualTokenDB._privateConstructor();

  VirtualTokenDB._privateConstructor();

  factory VirtualTokenDB() {
    return _db;
  }

  Future<void> insert(DeviceToken deviceToken) async {
    _deviceTokens.add(deviceToken);
  }

  Future<void> remove(String id) async {
    _deviceTokens.removeWhere((deviceToken) => deviceToken.deviceId == id);
  }

  Future<void> update(DeviceToken updatedDeviceToken) async {
    int i = _deviceTokens.indexWhere((deviceToken) => deviceToken.deviceId == updatedDeviceToken.deviceId);
    _deviceTokens[i] = updatedDeviceToken;
  }

  Future<List<DeviceToken>> listDeviceTokens() async {
    if (primeiraVez) {
      primeiraVez = false;
      late List<DeviceToken> devicetokensFromJson = [];
      try {
        final res = await dio.get(_data_URL);
        //devicetokensFromJson = listFromJson(res.data['deviceTokens']);
        devicetokensFromJson = res.data['deviceTokens']
            .map<DeviceToken>(
              (account) => DeviceToken.fromJson(account),
            )
            .toList();
        _deviceTokens.addAll(devicetokensFromJson);
      } on DioException {
        devicetokensFromJson = [];
        _deviceTokens = [];
      }
    } else {}
    return _deviceTokens;
  }

  List<DeviceToken> listFromJson(String jsonString) {
    var retorno = jsonDecode(jsonString).cast<Map<String, dynamic>>();
    return retorno.map<DeviceToken>((json) => DeviceToken.fromJson(json)).toList();
  }

  Future<List<DeviceToken>> list() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _deviceTokens;
  }

  Future<DeviceToken?> findOne(String id) async {
    return _deviceTokens.firstWhere((deviceToken) => deviceToken.deviceId == id);
  }
}
