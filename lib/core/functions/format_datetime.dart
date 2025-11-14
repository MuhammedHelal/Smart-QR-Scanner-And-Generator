import 'package:intl/intl.dart';

String formatDateTime(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final DateFormat formatter = DateFormat('d MMM yyyy, h:mm a');
  return formatter.format(dateTime);
}
