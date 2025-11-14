
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> myLaunchURL(String url) async {
  final uri = Uri.parse(url);
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      return true;
    }
  } on Exception catch (e) {
    debugPrint('Failed to launch URL: $url. Error: $e');
  }

  return false;
}
