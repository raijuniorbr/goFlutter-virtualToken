/// # Project: *TOKEN Generator*
///
/// DeviceToken is the data structure received
/// after device added on banckend
///
/// ### Copyright *C*hina *C*onstruction *B*ank - Brasil - June, 2023
/// by: **Rai Junior**
///

import 'package:dart_dash_otp/dart_dash_otp.dart';
//import 'package:base32/base32.dart';
import 'package:virtualtoken/common/globalvars.dart' as globals;

class DeviceToken {
  String deviceId;
  String secretKeyURL;
  String secretKey;
  String accountName;
  String? virtualTotp;
  bool? delete;

  DeviceToken({
    required this.deviceId,
    required this.secretKeyURL,
    required this.secretKey,
    required this.accountName,
    this.virtualTotp,
    this.delete,
  });

  factory DeviceToken.fromJson(Map<String, dynamic> json) {
    return DeviceToken(
      deviceId: json['deviceId'],
      secretKeyURL: json['secretKeyURL'],
      secretKey: json['secretKey'],
      accountName: json['accountName'],
      virtualTotp: json['virtualTotp'],
      delete: json['delete'],
    );
  }

/*
  String getFieldUserName() {
    int position = secretKeyURL.indexOf('?') - 8;
    String retorno = secretKeyURL.substring(position);
    return retorno.substring(0, 8);
  }

  String getFieldSecret() {
    int position = secretKeyURL.indexOf('=');
    String retorno = secretKeyURL.substring(position);
    position = retorno.indexOf('&');
    retorno = retorno.substring(1, position);
    return retorno;
  }

  String getFieldEndSerial() {
    int pos = serialNumber.length;
    String retorno = serialNumber.substring(pos - 12);
    return retorno;
  }
*/

  String getSecret() {
    String retorno = '', numOtp = '';

    final totp = TOTP(secret: secretKey, digits: 6, interval: globals.tokenPeriod);
    numOtp = totp.now();
    //retorno = '$numOtp |${totp.verify(otp: numOtp)}';
    retorno = numOtp;
    return retorno;
  }

  Map<String, dynamic> toJson() => {
        'deviceId': deviceId,
        'secretKeyURL': secretKeyURL,
        'secretKey': secretKey,
        'accountName': accountName,
        'virtualTotp': virtualTotp,
        'delete': delete,
      };
}
