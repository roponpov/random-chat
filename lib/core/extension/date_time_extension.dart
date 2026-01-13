import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String formatTime() {
    return DateFormat('hh:mm a').format(this);
  }
}
