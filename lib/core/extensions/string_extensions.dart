extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this == '';
  }
}

extension StringCapitalizeExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

extension StringCasingExtension on String {
  String formatTitle() {
    if (isEmpty) return this;

    final buffer = StringBuffer();
    bool capitalizeNext = true;

    for (int i = 0; i < length; i++) {
      final char = this[i];

      if (char == '_') {
        buffer.write(' ');
        capitalizeNext = true;
      } else {
        if (capitalizeNext) {
          buffer.write(char.toUpperCase());
          capitalizeNext = false;
        } else {
          buffer.write(char.toLowerCase());
        }
      }
    }

    return buffer.toString();
  }
}
