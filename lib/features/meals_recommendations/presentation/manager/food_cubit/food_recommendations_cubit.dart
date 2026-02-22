import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/meals_recommendations/data/local_service/mood_local_data_source.dart';
import 'package:moodly/features/meals_recommendations/data/models/meals_category_model.dart';
import 'package:moodly/features/meals_recommendations/domain/enums/food_type.dart';
import 'package:moodly/features/meals_recommendations/domain/enums/mood_type.dart';

import '../../../data/models/mood_food_model.dart';

part 'food_recommendations_state.dart';

class FoodRecommendationsCubit extends Cubit<FoodRecommendationsState> {
  final MoodLocalDataSource localDataSource;

  FoodRecommendationsCubit({required this.localDataSource})
    : super(FoodInitialState()) {
    loadMeals(category: FoodType.values.first, mood: MoodType.values.first);
  }

  Future<void> loadMeals({
    required FoodType category,
    required MoodType mood,
  }) async {
    try {
      emit(FoodLoadingState());

      final MealsCategoryModel data = await localDataSource.getMoodData(
        mood: mood,
      );
      final List<MoodFoodModel> items = data.getListByCategory(
        category: category,
      );
      emit(FoodLoadedState(meals: items, selectedCategory: category));
    } catch (e) {
      emit(FoodErrorState(message: e.toString()));
    }
  }
}
