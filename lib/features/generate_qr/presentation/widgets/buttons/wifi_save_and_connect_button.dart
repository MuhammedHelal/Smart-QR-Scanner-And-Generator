import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_reader/core/classes/qr_parser.dart';
import 'package:qr_reader/core/functions/get_android_version.dart';
import 'package:qr_reader/core/functions/show_toast.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/action_button_impl.dart';
import 'package:wifi_iot/wifi_iot.dart';

class WifiSaveWifiAndConnectButton extends StatelessWidget {
  const WifiSaveWifiAndConnectButton({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return ActionButtonImpl(
      icon: const Icon(
        Icons.wifi,
        size: 30,
      ),
      title: 'Save and Connect to Wifi',
      onPressed: () async {
        await _saveAndConnectToWifi(data);
      },
    );
  }
}

Future<void> _saveAndConnectToWifi(String data) async {
  RegExp regex = QRCodeParser.wifiRegex;
  RegExpMatch? match = regex.firstMatch(data);

  String ssid = match?.group(1) ?? "";
  String securityType = match?.group(2) ?? "";
  String password = match?.group(3) ?? "";
  String hiddenStatus = match?.group(4) ?? "";
  bool isEnabled = await WiFiForIoTPlugin.isEnabled();
  int version = await getAndroidVersion();
  if (version < 10) {
    await showToast(
      toastLength: Toast.LENGTH_LONG,
      message:
          'This feature is only supported on Android 10 and above\nPlease connect manually\n\ncurrent version is $version',
      color: Colors.red,
    );
    return;
  }

  if (securityType == 'WEP') {
    await showToast(
      toastLength: Toast.LENGTH_LONG,
      message:
          'Connecting to WEP networks is not supported on Android 10 and above\n\nPlease connect manually',
      color: Colors.red,
    );
    return;
  }

/*  if (await Permission.location.isDenied) {
    final status = await Permission.location.request();
    if (status.isDenied) {
      await showToast(
        message:
            'Please enable location permission so we can search for wifi networks',
        color: Colors.red,
      );
      return;
    }
  }*/

  if (!isEnabled) {
    await showToast(message: 'Please enable wifi first', color: Colors.red);

    await WiFiForIoTPlugin.setEnabled(true, shouldOpenSettings: true);
    return;
  }
  final result = await WiFiForIoTPlugin.registerWifiNetwork(
    ssid,
    isHidden: bool.parse(hiddenStatus),
    security: _parseNetworkSecurity(securityType),
    password: password,
  );
  if (result) {
    await showToast(
      message: 'Saved $ssid successfully.',
      color: Colors.green,
    );
  } else {
    await showToast(message: 'Failed to save $ssid', color: Colors.red);
  }

  bool connected = await WiFiForIoTPlugin.connect(
    withInternet: true,
    ssid,
    joinOnce: false,
    isHidden: bool.parse(hiddenStatus),
    security: _parseNetworkSecurity(securityType),
    password: password,
  );
  if (connected) {
    await showToast(
      message: 'Connected successfully!\nPlease be in range to use it',
      color: Colors.green,
    );
  } else {
    await showToast(
      message: 'Failed to connect',
      color: Colors.red,
    );
  }
}

NetworkSecurity _parseNetworkSecurity(String networkSecurity) {
  switch (networkSecurity) {
    case 'NONE':
      return NetworkSecurity.NONE;
    case 'WEP':
      return NetworkSecurity.WEP;
    default:
      return NetworkSecurity.WPA;
  }
}
