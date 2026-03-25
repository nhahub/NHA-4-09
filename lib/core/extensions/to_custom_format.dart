import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toCustomFormat() {
    return DateFormat('MMMM d. h:mm a').format(this);
  }
}