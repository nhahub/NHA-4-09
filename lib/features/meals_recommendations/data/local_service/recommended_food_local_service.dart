import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:moodly/features/meals_recommendations/data/models/recommended_food_lists_model.dart';
import '../../domain/enums/mood_type.dart';

class RecommendedFoodLocalService {
  Future<RecommendedFoodListsModel> getRecommendedFoodData({
    required MoodType moodType,
  }) async {
    final String moodName = moodTypeToString(moodType);

    final String jsonString = await rootBundle.loadString(
      'assets/data/moods/$moodName.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    final moodData = decoded[moodName];

    return RecommendedFoodListsModel.fromJson(moodData);
  }
}
