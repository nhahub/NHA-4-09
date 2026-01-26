import '../models/mood_chart.dart';
import '../../domain/enums/emoji_range.dart';
import '../../domain/enums/months_range.dart';

final List<MoodChart> yearMood = [
  MoodChart(
    label: MonthsRange.jan.shortName,
    value: 2,
    emoji: EmojiRange.neutral.emoji,
  ),
  MoodChart(
    label: MonthsRange.feb.shortName,
    value: 3,
    emoji: EmojiRange.good.emoji,
  ),
  MoodChart(
    label: MonthsRange.mar.shortName,
    value: 4,
    emoji: EmojiRange.veryGood.emoji,
  ),
  MoodChart(
    label: MonthsRange.apr.shortName,
    value: 1,
    emoji: EmojiRange.bad.emoji,
  ),
  MoodChart(
    label: MonthsRange.may.shortName,
    value: 0.5,
    emoji: EmojiRange.veryBad.emoji,
  ),
  MoodChart(
    label: MonthsRange.jun.shortName,
    value: 3,
    emoji: EmojiRange.good.emoji,
  ),
  MoodChart(
    label: MonthsRange.jul.shortName,
    value: 2,
    emoji: EmojiRange.neutral.emoji,
  ),
  MoodChart(
    label: MonthsRange.aug.shortName,
    value: 4,
    emoji: EmojiRange.veryGood.emoji,
  ),
  MoodChart(
    label: MonthsRange.sep.shortName,
    value: 1.5,
    emoji: EmojiRange.bad.emoji,
  ),
  MoodChart(
    label: MonthsRange.oct.shortName,
    value: 3,
    emoji: EmojiRange.good.emoji,
  ),
  MoodChart(
    label: MonthsRange.nov.shortName,
    value: 2,
    emoji: EmojiRange.neutral.emoji,
  ),
  MoodChart(
    label: MonthsRange.dec.shortName,
    value: 4,
    emoji: EmojiRange.veryGood.emoji,
  ),
];
