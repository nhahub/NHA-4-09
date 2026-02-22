import 'package:intl/intl.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/cache_helper.dart';

class WaterLocalService {
  static String get _today => DateFormat('yyyy-MM-dd').format(DateTime.now());

  static Future<int> getCurrentCups() async {
    final String lastDate =
        CacheHelper.getString(key: kLastWaterDate) ?? _today;

    if (lastDate != _today) {
      await resetCups();
    }

    return CacheHelper.getInt(key: kDailyWaterCups);
  }

  static Future<int> incrementCup() async {
    int current = await getCurrentCups();
    if (current >= kMaxCups) return current;

    current++;
    await _saveCupsAndDate(current);
    return current;
  }

  static Future<void> resetCups() async {
    await _saveCupsAndDate(0);
  }

  // Helper to save both cups and date together
  static Future<void> _saveCupsAndDate(int cups) async {
    await CacheHelper.set(key: kDailyWaterCups, value: cups);
    await CacheHelper.set(key: kLastWaterDate, value: _today);
  }
}
