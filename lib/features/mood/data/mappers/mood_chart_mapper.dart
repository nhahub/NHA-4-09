import 'dart:math';
import '../helpers/mood_progress_helper.dart';
import '../helpers/data_helper.dart';
import '../models/mood_chart.dart';

class MoodChartMapper {
  static List<MoodChart> mapWeek(List<dynamic> data) {
    final Map<int, MoodChart> result = {};

    for (var item in data) {
      final date = DateTime.parse(item['day']);
      final weekday = date.weekday;

      result[weekday] = MoodChart(
        label: DateHelper.getDayName(weekday),
        value: (item['count'] as int).toDouble(),
        emoji: MoodProgressHelper.mapMoodToEmoji( mood: item['current_mood']),
      );
    }

    return List.generate(7, (index) {
      final day = index + 1;

      return result[day] ??
          MoodChart(
            label: DateHelper.getDayName(day),
            value: 0,
            emoji: MoodProgressHelper.defaultEmoji,
          );
    });
  }

  static List<MoodChart> mapMonth(List<dynamic> data) {
    final Map<int, double> weekValues = {};

    for (var item in data) {
      var rawDate = item['week_start'];
      DateTime date;

      if (rawDate is String) {
        date = DateTime.parse(rawDate);
      } else if (rawDate is DateTime) {
        date = rawDate;
      } else if (rawDate is Map && rawDate.containsKey('value')) {
        date = DateTime.parse(rawDate['value']);
      } else {
        continue;
      }

      final weekOfMonth = ((date.day - 1) ~/ 7) + 1;

      weekValues[weekOfMonth] =
          (weekValues[weekOfMonth] ?? 0) + (item['count'] as int).toDouble();
    }

    return List.generate(4, (index) {
      final week = index + 1;

      return weekValues[week] != null
          ? MoodChart(
              label: 'Week $week',
              value: min(weekValues[week] ?? 0, 4),
              emoji: MoodProgressHelper.mapMoodToEmoji(mood : data[index]['current_mood']),
            )
          : MoodChart(
              label: 'Week $week',
              value: 0,
              emoji: MoodProgressHelper.defaultEmoji,
            );
    });
  }

  static List<MoodChart> mapYear(var data) {
    final Map<int, MoodChart> monthValues = {};

    for (var item in data) {
      final rawDate = item['month_start'];

      DateTime date;
      if (rawDate is String) {
        date = DateTime.parse(rawDate);
      } else if (rawDate is DateTime) {
        date = rawDate;
      } else if (rawDate is Map && rawDate.containsKey('value')) {
        date = DateTime.parse(rawDate['value']);
      } else {
        continue;
      }

      final month = date.month;
      monthValues[month] = MoodChart(
        label: DateHelper.getMonthName(month),
        value: (item['count'] as int).toDouble() % 5,
        emoji: MoodProgressHelper.mapMoodToEmoji(mood: item['current_mood']),
      );
    }

    return List.generate(12, (index) {
      final month = index + 1;
      return monthValues[month] ??
          MoodChart(
            label: DateHelper.getMonthName(month),
            value: 0,
            emoji: MoodProgressHelper.defaultEmoji,
          );
    });
  }
}
