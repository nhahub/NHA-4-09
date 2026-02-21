import '../enums/mood_type.dart';

String moodTypeToString(MoodType mood) {
  switch (mood) {
    case MoodType.angry:
      return 'angry';
    case MoodType.happy:
      return 'happy';
    case MoodType.depressed:
      return 'depressed';
    case MoodType.anxious:
      return 'anxious';
    case MoodType.lowEnergy:
      return 'low_energy';
    case MoodType.neutral:
      return 'neutral';
  }
}

MoodType moodTypeFromString(String value) {
  switch (value) {
    case 'angry':
      return MoodType.angry;
    case 'happy':
      return MoodType.happy;
    case 'depressed':
      return MoodType.depressed;
    case 'anxious':
      return MoodType.anxious;
    case 'low_energy':
      return MoodType.lowEnergy;
    case 'neutral':
      return MoodType.neutral;
    default:
      throw Exception('Unknown mood type: $value');
  }
}
