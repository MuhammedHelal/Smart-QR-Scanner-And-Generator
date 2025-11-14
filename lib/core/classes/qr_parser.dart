enum QRCodeType {
  email,
  wifi,
  sms,
  text,
  event,
  website,
}

class QRCodeParser {
  static final RegExp emailRegex = RegExp(
    r'^mailto:([^?]+)\?subject=([^&]+)&body=(.*)',
    multiLine: true,
    dotAll: true,
  );
  static final RegExp wifiRegex =
      RegExp(r"WIFI:S:(.*?);T:(.*?);P:(.*?);H:(.*?);");
  static final RegExp _smsRegex = RegExp(r'^sms:([^?]+)\?body=(.+)$');
  static final RegExp _websiteRegex = RegExp(
      r'^(https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$');

  static final RegExp _eventRegex = RegExp(
    r'''BEGIN:VCALENDAR\s*
VERSION:2\.0\s*
PRODID:-//hacksw/handcal//NONSGML v1\.0//EN\s*
BEGIN:VEVENT\s*
SUMMARY:(.+?)\s*
DTSTART:(.+?)\s*
DTEND:(.+?)\s*
LOCATION:(.+?)\s*
DESCRIPTION:(.+?)\s*
END:VEVENT\s*
END:VCALENDAR''',
    multiLine: true,
    dotAll: true,
    caseSensitive: false,
  );

  static QRCodeType getQRCodeType(String data) {
    if (emailRegex.hasMatch(data)) {
      return QRCodeType.email;
    } else if (wifiRegex.hasMatch(data)) {
      return QRCodeType.wifi;
    } else if (_smsRegex.hasMatch(data)) {
      return QRCodeType.sms;
    } else if (_websiteRegex.hasMatch(data)) {
      return QRCodeType.website;
    } else if (_eventRegex.hasMatch(data)) {
      return QRCodeType.event;
    } else {
      return QRCodeType.text;
    }
  }

  static String? _parseEventQRCode(String data) {
    final match = _eventRegex.firstMatch(data);
    if (match != null) {
      String summary = match.group(1) ?? '';
      String start = match.group(2) ?? '';
      String end = match.group(3) ?? '';
      String location = match.group(4) ?? '';
      String description = match.group(5) ?? '';
      return 'Name: $summary\nStart date: $start\nEnd date: $end\nLocation: $location\nDescription: $description';
    }
    return null;
  }

  static String? parseQrCodeType({
    required QRCodeType type,
    required String data,
  }) {
    switch (type) {
      case QRCodeType.email:
        return _parseEmailQRCode(data);
      case QRCodeType.wifi:
        return _parseWiFiQRCode(data);
      case QRCodeType.sms:
        return _parseSMSQRCode(data);
      case QRCodeType.website:
        return _parseWebsiteQRCode(data);
      case QRCodeType.event:
        return _parseEventQRCode(data);
      default:
        return _parseTextQRCode(data);
    }
  }

  static String? _parseEmailQRCode(String data) {
    final match = emailRegex.firstMatch(data);
    if (match != null) {
      String email = match.group(1) ?? '';
      String subject = Uri.decodeComponent(match.group(2) ?? '');
      String body = Uri.decodeComponent(match.group(3) ?? '');
      return 'Email: $email\nSubject: $subject\nBody: $body';
    }
    return null;
  }

  static String? _parseWiFiQRCode(String data) {
    final match = wifiRegex.firstMatch(data);
    if (match != null) {
      String ssid = match.group(1) ?? "";
      String securityType = match.group(2) ?? "";
      String password = match.group(3) ?? "";
      String hiddenStatus = match.group(4) ?? "";
      return 'Security: $securityType\nSSID: $ssid\nPassword: $password\nHidden: $hiddenStatus';
    }
    return null;
  }

  static String? _parseSMSQRCode(String data) {
    final match = _smsRegex.firstMatch(data);
    if (match != null) {
      String phone = match.group(1) ?? '';
      String body = Uri.decodeComponent(match.group(2) ?? '');
      return 'Phone: $phone\nBody: $body';
    }
    return null;
  }

  static String _parseTextQRCode(String data) {
    return 'Text: $data';
  }

  static String _parseWebsiteQRCode(String data) {
    return 'Website: $data';
  }
}
