extension DateTimeFormatting on DateTime {
  String formatHHmm() =>
      "${(hour - 12).toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
}
