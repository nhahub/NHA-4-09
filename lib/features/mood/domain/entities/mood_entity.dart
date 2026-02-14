class MoodEntity {
  final String mood;
  final int moodValue;
  final String type; // daily, after_activity
  final String? note;
  final String? source;
  final DateTime createdAt;

  MoodEntity({
    required this.mood,
    required this.moodValue,
    required this.type,
    this.note,
    this.source,
    required this.createdAt,
  });
}
