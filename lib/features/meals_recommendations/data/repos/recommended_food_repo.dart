import 'package:dartz/dartz.dart';
import '../../../mood/data/services/mood_local_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../domain/enums/food_type.dart';
import '../../domain/enums/mood_type.dart';
import '../local_service/recommended_food_local_service.dart';
import '../models/recommended_food_item_model.dart';
import '../models/recommended_food_lists_model.dart';

class RecommendedFoodRepo {
  final RecommendedFoodLocalService localService;

  RecommendedFoodRepo({required this.localService});

  Future<Either<Failure, List<RecommendedFoodItemModel>>> getRecommendedFood({
    required FoodType foodType,
  }) async {
    try {
      final String selectedDailyMood =
          MoodLocalService.getSelectedDailyMood() ?? "Calm";
      final data = await localService.getRecommendedFoodData(
        moodType: moodTypeFromString(selectedDailyMood),
      );
      return right(data.getListByFoodType(foodType: foodType));
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
