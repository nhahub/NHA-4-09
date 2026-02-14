import 'package:moodly/features/mood/domain/entities/mood_entity.dart';

class MoodModel extends MoodEntity {
  MoodModel({
    required super.mood,
    required super.moodValue,
    required super.type,
    super.note,
    super.source,
    required super.createdAt,
  });

  Map<String, dynamic> toMap(String userId) => {
    'user_id': userId,
    'mood': mood,
    'mood_value': moodValue,
    'mood_type': type,
    'note': note,
    'source': source,
    'created_at': createdAt.toIso8601String(),
  };
}
