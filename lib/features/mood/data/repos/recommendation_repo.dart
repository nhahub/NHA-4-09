import '../models/recommendation_model.dart';
import '../services/mood_local_service.dart';
import '../services/recommendation_local_service.dart';

class RecommendationRepo {
  final RecommendationLocalService _recommendationLocalService;
  final MoodLocalService _moodLocalService;

  RecommendationRepo({
    required RecommendationLocalService recommendationLocalService,
    required MoodLocalService moodLocalService,
  }) : _recommendationLocalService = recommendationLocalService,
       _moodLocalService = moodLocalService;

  Future<RecommendationModel> getRecommendationData() async {
    final moodName = _moodLocalService.getSelectedDailyMood();

    final RecommendationModel recommendationData =
        await _recommendationLocalService.getRecommendationData(
          moodName: moodName?.toLowerCase() ?? "calm",
        );

    return recommendationData;
  }
}
