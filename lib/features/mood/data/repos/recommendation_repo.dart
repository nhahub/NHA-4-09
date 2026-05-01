import '../models/recommendation_model.dart';
import '../services/recommendation_local_service.dart';

class RecommendationRepo {
  final RecommendationLocalService _recommendationLocalService;

  RecommendationRepo({
    required RecommendationLocalService recommendationLocalService,
  }) : _recommendationLocalService = recommendationLocalService;

  Future<RecommendationModel> getRecommendationData({
    required String currentMood,
  }) async {
    final RecommendationModel recommendationData =
        await _recommendationLocalService.getRecommendationData(
          moodName: currentMood.toLowerCase(),
        );

    return recommendationData;
  }
}
