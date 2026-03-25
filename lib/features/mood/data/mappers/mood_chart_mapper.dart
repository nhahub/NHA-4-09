import 'dart:math';

import '../helpers/data_helper.dart';
import '../helpers/mood_progress_helper.dart';
import '../models/mood_chart.dart';

class MoodChartMapper {
  // --- Helper to parse various date formats ---
  static DateTime? _parseDate(dynamic rawDate) {
    if (rawDate == null) return null;
    if (rawDate is DateTime) return rawDate;
    if (rawDate is String) return DateTime.tryParse(rawDate);
    if (rawDate is Map && rawDate.containsKey('value')) {
      return DateTime.tryParse(rawDate['value']);
    }
    return null;
  }

  // --- Helper to create a MoodChart with defaults ---
  static MoodChart _buildChart({
    required String label,
    double value = 0,
    String? emoji,
  }) {
    return MoodChart(
      label: label,
      value: value,
      emoji: emoji ?? MoodProgressHelper.defaultEmoji,
    );
  }

  // --- Map week data ---
  static List<MoodChart> mapWeek(List<dynamic> data) {
    final Map<int, MoodChart> weekMap = {};

    for (var item in data) {
      final date = _parseDate(item['day']);
      if (date == null) continue;

      final weekday = date.weekday;
      final itemCount = item['count'] as int;
      double value = 0;
      if (itemCount == 0) {
        value = 0;
      } else if (itemCount > 4) {
        value = 4;
      } else {
        value = itemCount.toDouble();
      }
      weekMap[weekday] = _buildChart(
        label: DateHelper.getDayName(weekday),
        value: value,
        emoji: MoodProgressHelper.mapMoodToEmoji(mood: item['current_mood']),
      );
    }

    // Ensure all 7 days are present
    return List.generate(7, (index) {
      final day = index + 1;
      return weekMap[day] ?? _buildChart(label: DateHelper.getDayName(day));
    });
  }

  // --- Map month data ---
  static List<MoodChart> mapMonth(List<dynamic> data) {
    final Map<int, double> weekValues = {};
    final Map<int, dynamic> moodMap = {};

    for (var item in data) {
      final date = _parseDate(item['week_start']);
      if (date == null) continue;

      final weekOfMonth = ((date.day - 1) ~/ 7) + 1;
      weekValues[weekOfMonth] =
          (weekValues[weekOfMonth] ?? 0) + (item['count'] as int).toDouble();
      moodMap[weekOfMonth] = item['current_mood'];
    }

    return List.generate(4, (index) {
      final week = index + 1;
      final value = weekValues[week] != null ? min(weekValues[week]!, 4) : 0;
      final emoji = weekValues[week] != null
          ? MoodProgressHelper.mapMoodToEmoji(mood: moodMap[week])
          : null;
      return _buildChart(
        label: 'Week $week',
        value: value.toDouble(),
        emoji: emoji,
      );
    });
  }

  // --- Map year data ---
  static List<MoodChart> mapYear(List<dynamic> data) {
    final Map<int, MoodChart> monthMap = {};

    for (var item in data) {
      final date = _parseDate(item['month_start']);
      if (date == null) continue;

      final month = date.month;
      monthMap[month] = _buildChart(
        label: DateHelper.getMonthName(month),
        value: (item['count'] as int).toDouble() % 5,
        emoji: MoodProgressHelper.mapMoodToEmoji(mood: item['current_mood']),
      );
    }

    return List.generate(12, (index) {
      final month = index + 1;
      return monthMap[month] ??
          _buildChart(label: DateHelper.getMonthName(month));
    });
  }
}
