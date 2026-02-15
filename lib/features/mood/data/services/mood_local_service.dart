import '../../../../core/constants/constants.dart';
import '../../../../core/services/cache_helper.dart';

class MoodLocalService {
  static Future<void> setHasSelectedDailyMood() async {
    final today = DateTime.now().toIso8601String();
    await CacheHelper.set(key: kHasSelectedDailyMood, value: today);
  }

  static bool hasSelectedDailyMood() {
    final savedDate = CacheHelper.getString(key: kHasSelectedDailyMood);
    if (savedDate == null) return false;

    final lastDate = DateTime.parse(savedDate);
    final now = DateTime.now();

    return lastDate.year == now.year &&
        lastDate.month == now.month &&
        lastDate.day == now.day;
  }

  static Future<void> setSelectedDailyMood({required String dailyMood}) async {
    await CacheHelper.set(key: kSelectedDailyMood, value: dailyMood);
    await setHasSelectedDailyMood();
  }

  static String? getSelectedDailyMood() {
    return CacheHelper.getString(key: kSelectedDailyMood);
  }
}
