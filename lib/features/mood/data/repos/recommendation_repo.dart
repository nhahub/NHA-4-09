import 'package:dartz/dartz.dart';
import '../services/mood_local_service.dart';
import '../services/recommendation_local_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/recommendation_model.dart';

class RecommendationRepo {
  final RecommendationLocalService recommendationLocalService;

  RecommendationRepo({required this.recommendationLocalService});

  Future<Either<Failure, RecommendationModel>> getRecommendationData() async {
    try {
      final moodName = MoodLocalService.getSelectedDailyMood();

      final RecommendationModel recommendationData =
          await recommendationLocalService.getRecommendationData(
            moodName: moodName?.toLowerCase() ?? "calm",
          );

      return right(recommendationData);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
