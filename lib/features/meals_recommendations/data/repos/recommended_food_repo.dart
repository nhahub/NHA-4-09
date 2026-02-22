import 'package:dartz/dartz.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/features/meals_recommendations/data/local_service/recommended_food_local_service.dart';
import 'package:moodly/features/meals_recommendations/data/models/recommended_food_item_model.dart';
import 'package:moodly/features/meals_recommendations/data/models/recommended_food_lists_model.dart';
import 'package:moodly/features/meals_recommendations/domain/enums/food_type.dart';
import 'package:moodly/features/meals_recommendations/domain/enums/mood_type.dart';

import '../../../../core/errors/failure.dart';

class RecommendedFoodRepo {
  final RecommendedFoodLocalService localService;

  RecommendedFoodRepo({required this.localService});

  Future<Either<Failure, List<RecommendedFoodItemModel>>> getRecommendedFood({
    required MoodType moodType,
    required FoodType foodType,
  }) async {
    try {
      final data = await localService.getRecommendedFoodData(
        moodType: moodType,
      );
      return right(data.getListByFoodType(foodType: foodType));
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
