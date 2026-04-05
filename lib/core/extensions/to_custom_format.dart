import 'package:intl/intl.dart';

extension DateFormatting on DateTime? {
  String toCustomFormat() {
    if (this == null) return "";
    return DateFormat('MMMM d. h:mm a').format(this!);
  }
}