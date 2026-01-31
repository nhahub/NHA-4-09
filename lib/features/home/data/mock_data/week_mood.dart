import '../../domain/enums/emoji_range.dart';
import '../../domain/enums/week_dayes_range.dart';
import '../models/mood_chart.dart';

final List<MoodChart> weekMood = [
  MoodChart(
    label: WeekDayesRange.mon.dayName,
    value: 2,
    emoji: EmojiRange.neutral.emoji,
  ),
  MoodChart(
    label: WeekDayesRange.tue.dayName,
    value: 3,
    emoji: EmojiRange.good.emoji,
  ),
  MoodChart(
    label: WeekDayesRange.wed.dayName,
    value: 4,
    emoji: EmojiRange.veryGood.emoji,
  ),
  MoodChart(
    label: WeekDayesRange.thu.dayName,
    value: 1,
    emoji: EmojiRange.bad.emoji,
  ),
  MoodChart(
    label: WeekDayesRange.fri.dayName,
    value: 0.2,
    emoji: EmojiRange.veryBad.emoji,
  ),
  MoodChart(
    label: WeekDayesRange.sat.dayName,
    value: 3,
    emoji: EmojiRange.good.emoji,
  ),
  MoodChart(
    label: WeekDayesRange.sun.dayName,
    value: 2,
    emoji: EmojiRange.neutral.emoji,
  ),
];