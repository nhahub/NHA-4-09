import 'package:moodly/core/theming/app_assets.dart';

class MoodChart {
  final String day;
  final double value;
  final String emoji;

  MoodChart({required this.day, required this.value, required this.emoji});
}

final List<MoodChart> weekMood = [
  MoodChart(day: 'Mon', value: 2, emoji: AppAssets.neutral),
  MoodChart(day: 'Tue', value: 3, emoji: AppAssets.good),
  MoodChart(day: 'Wed', value: 4, emoji: AppAssets.veryGood),
  MoodChart(day: 'Thu', value: 1, emoji: AppAssets.bad),
  MoodChart(day: 'Fri', value: 0.2, emoji: AppAssets.veryBad),
  MoodChart(day: 'Sat', value: 3, emoji: AppAssets.good),
  MoodChart(day: 'Sun', value: 2, emoji: AppAssets.neutral),
];
