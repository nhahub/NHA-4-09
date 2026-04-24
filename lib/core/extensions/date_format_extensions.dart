import 'package:intl/intl.dart';

extension StringDateExtensions on String {
  String toFormattedDate() {
    final date = DateTime.parse(this);
    return DateFormat('dd MMM, yyyy').format(date);
  }
}