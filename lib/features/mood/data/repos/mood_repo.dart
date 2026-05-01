import '../services/mood_local_service.dart';

import '../../../../core/functions/user_data_local.dart';
import '../models/mood_model.dart';
import '../services/mood_remote_service.dart';

class MoodRepo {
  final MoodRemoteService _moodRemoteService;
  final MoodLocalService _moodLocalService;

  MoodRepo({
    required MoodRemoteService moodRemoteService,
    required MoodLocalService moodLocalService,
  }) : _moodRemoteService = moodRemoteService,
       _moodLocalService = moodLocalService;

  Future<void> saveCurrentMood({required String currentMood}) async {
    await _moodRemoteService.saveCurrentMood(
      moodModel: MoodModel(
        userId: getUser()!.userId,
        currentMood: currentMood,
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<String?> getSavedMood() async {
    final String? localResult = _moodLocalService.getSelectedDailyMood();
    return localResult;
  }

  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Future<bool> hasSelectedDailyMood() async {
    final bool? localResult = _moodLocalService.hasSelectedDailyMood();

    if (localResult != null) {
      return localResult;
    }

    final MoodModel? mood = await _moodRemoteService.getCurrentMood();

    if (mood == null) return false;

    final now = DateTime.now();

    final isToday = isSameDay(mood.createdAt, now);

    if (isToday) {
      await _moodLocalService.setSelectedDailyMood(dailyMood: mood.currentMood);
    }

    return isToday;
  }
}
