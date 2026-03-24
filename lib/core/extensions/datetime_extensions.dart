extension DateTimeFormatting on DateTime {
  String formatHHmm() =>
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
}
