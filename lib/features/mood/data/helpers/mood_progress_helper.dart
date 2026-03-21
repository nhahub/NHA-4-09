import '../../../home/domain/enums/emoji_range.dart';

class MoodProgressHelper {
  static String mapMoodToEmoji({required String mood}) {
    switch (mood) {
      case 'Angry':
        return EmojiRange.veryBad.emoji;
      case 'Anxious':
        return EmojiRange.bad.emoji;
      case 'Neutral':
        return EmojiRange.neutral.emoji;
      case 'Calm':
        return EmojiRange.good.emoji;
      case 'Happy':
        return EmojiRange.veryGood.emoji;
      default:
        return EmojiRange.neutral.emoji;
    }
  }

  static String get defaultEmoji => EmojiRange.neutral.emoji;
}
