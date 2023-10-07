/// # Project: *TOKEN Generator*
///
/// DeviceInfo is the data structure from device (Android/iOS/Other)
/// API from flutter retrieve from OS.
///
/// See getDeviceInfo() on lib/commons/commons.dart
///
/// ### Copyright *N*aran *C*onsulting and *T*raining - Brazil - Oct, 2023
/// by: **Rai Junior**
class DeviceInfo {
  late String deviceType;
  late String manufacturer;
  late String deviceName;
  late String deviceCustomerId;
  late String deviceOsVersion;

  DeviceInfo({
    required this.deviceType,
    required this.manufacturer,
    required this.deviceName,
    required this.deviceCustomerId,
    required this.deviceOsVersion,
  });

  factory DeviceInfo.fromJson(Map<String, dynamic> json) {
    return DeviceInfo(
      deviceType: json['deviceType'],
      manufacturer: json['manufacturer'],
      deviceName: json['deviceName'],
      deviceCustomerId: json['deviceCustomerId'],
      deviceOsVersion: json['deviceOsVersion'],
    );
  }

  Map<String, dynamic> toJson() => {
        'deviceType': deviceType,
        'manufacturer': manufacturer,
        'deviceName': deviceName,
        'deviceCustomerId': deviceCustomerId,
        'deviceOsVersion': deviceOsVersion,
      };
}
