import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toFormattedDate() {
    return DateFormat('dd MMM, yyyy').format(this);
  }
}
