import '../helpers/mood_progress_helper.dart';
import '../../../../core/helpers/logger.dart';
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
        emoji: MoodProgressHelper.mapMoodToEmoji(item['current_mood']),
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

  // ---- MAP MONTH ----
  static List<MoodChart> mapMonth(List<dynamic> data) {
    final Map<int, double> weekValues = {};

    for (var item in data) {
      final date = DateTime.parse(item['day']);
      final weekOfMonth = ((date.day - 1) ~/ 7) + 1;

      weekValues[weekOfMonth] =
          (weekValues[weekOfMonth] ?? 0) + (item['count'] as int).toDouble();
    }

    // نضمن كل 5 أسابيع موجودة على الأقل
    return List.generate(5, (index) {
      final week = index + 1;
      return MoodChart(
        label: 'Week $week',
        value: weekValues[week] ?? 0,
        emoji: MoodProgressHelper.defaultEmoji,
      );
    });
  }

  static List<MoodChart> mapYear(List<dynamic> data) {
    Logger.log(data[0]);

    final Map<int, MoodChart> monthValues = {};
    for (var item in data) {
      final date = item['month_start'] is String
          ? DateTime.parse(item['month_start'])
          : item['month_start'] as DateTime;

      final month = date.month;

      monthValues[month] = MoodChart(
        label: DateHelper.getMonthName(month),
        value: (item['count'] as int).toDouble(),
        emoji: MoodProgressHelper.defaultEmoji,
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
