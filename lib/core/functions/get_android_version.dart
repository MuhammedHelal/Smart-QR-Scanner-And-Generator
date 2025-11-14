import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:qr_reader/core/services/locator.dart';

Future<int> getAndroidVersion() async {
  final AndroidDeviceInfo androidInfo =
      await locator<DeviceInfoPlugin>().androidInfo;
  String androidVersion = androidInfo.version.release;

  int version = int.parse(androidVersion.replaceAll('.', ''));
  log('version: $version');
  return version;
}
