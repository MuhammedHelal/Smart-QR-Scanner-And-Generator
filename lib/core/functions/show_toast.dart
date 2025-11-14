import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showToast({
  required String message,
  required Color color,
  Toast toastLength = Toast.LENGTH_SHORT,
}) async {
  await Fluttertoast.showToast(
    msg: message,
    toastLength: toastLength,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.black,
    fontSize: 16.0,
  );
}
