extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this == '';
  }
}

extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}