enum MoodType { angry, anxious, neutral, calm, happy }

String moodTypeToString(MoodType mood) {
  switch (mood) {
    case MoodType.angry:
      return 'angry';
    case MoodType.anxious:
      return 'anxious';
    case MoodType.neutral:
      return 'neutral';
    case MoodType.calm:
      return 'calm';
    case MoodType.happy:
      return 'happy';
  }
}

MoodType moodTypeFromString(String value) {
  switch (value) {
    case 'Angry':
      return MoodType.angry;
    case 'Anxious':
      return MoodType.anxious;
    case 'Neutral':
      return MoodType.neutral;
    case 'Calm':
      return MoodType.calm;
    case 'Happy':
      return MoodType.happy;
    default:
      throw Exception('Unknown mood type: $value');
  }
}
