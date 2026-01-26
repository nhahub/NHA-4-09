import '../models/mood_chart.dart';
import '../../domain/enums/emoji_range.dart';
import '../../domain/enums/weeks_range.dart';

final List<MoodChart> monthMood = [
  MoodChart(
    label: WeeksRange.week1.weekNumber,
    value: 2,
    emoji: EmojiRange.neutral.emoji,
  ),
  MoodChart(
    label: WeeksRange.week2.weekNumber,
    value: 3,
    emoji: EmojiRange.good.emoji,
  ),
  MoodChart(
    label: WeeksRange.week3.weekNumber,
    value: 4,
    emoji: EmojiRange.veryGood.emoji,
  ),
  MoodChart(
    label: WeeksRange.week4.weekNumber,
    value: 1,
    emoji: EmojiRange.bad.emoji,
  ),
];
