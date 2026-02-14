import 'package:moodly/features/mood/data/models/mood_model.dart';
import 'package:moodly/features/mood/data/services/mood_remote_service.dart';

class MoodRepo {
  final MoodRemoteService moodRemoteService;

  MoodRepo(this.moodRemoteService);

  Future<void> saveDailyMood(MoodModel mood, String userId) {
    return moodRemoteService.insertMood(mood, userId);
  }

  Future<bool> hasDailyMood(String userId) async {
    final data = await moodRemoteService.getTodayMood(userId);
    return data.isNotEmpty;
  }
}
