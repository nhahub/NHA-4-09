extension PublishedDateX on String? {
  String get yearOnly {
    if (this == null || this!.isEmpty) return '';

    return this!.split('-').first;
  }
}