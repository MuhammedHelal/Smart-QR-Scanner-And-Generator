
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_reader/core/classes/qr_parser.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/buttons/email_send_email_button.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/buttons/sms_send_sms_button.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/buttons/website_open_url_button.dart';
import 'package:qr_reader/features/generate_qr/presentation/widgets/buttons/wifi_save_and_connect_button.dart';

const platform = MethodChannel('dev.moashraf.qr_reader.fileprovider');

Widget buildActionbutton({
  required String data,
  required QRCodeType type,
}) {
  switch (type) {
    case QRCodeType.email:
      return EmailSendEmailButton(data: data);
    case QRCodeType.website:
      return WebsiteOpenUrlButton(data: data);

    case QRCodeType.sms:
      return SmsSendSmsButton(data: data);
    case QRCodeType.wifi:
      return WifiSaveWifiAndConnectButton(data: data);

    default:
      return const SizedBox.shrink();
  }
}

/* Future<void> saveAndOpenICS(String ics) async {
  final directory = await getApplicationCacheDirectory();
  final file = File('${directory.path}/event.ics');

  await file.writeAsString(ics);

  final uri = await platform.invokeMethod<String>(
    'getFileUri',
    {'path': file.path},
  );

  final intent = AndroidIntent(
    action: 'android.intent.action.VIEW',
    data: uri,
    type: 'text/calendar',
    flags: [
      Flag.FLAG_GRANT_READ_URI_PERMISSION,
      Flag.FLAG_GRANT_WRITE_URI_PERMISSION,
      Flag.FLAG_ACTIVITY_NEW_TASK,
      Flag.FLAG_ACTIVITY_BROUGHT_TO_FRONT,
    ],
  );
  await intent.launch();
  /*final result = await Share.shareXFiles(
    [
      XFile(
        file.path,
        name: 'event.ics',
        mimeType: 'text/calendar',
      ),
    ],
    text: 'Add event to calendar',
  );
  log(result.status.toString());*/
}*/
