import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:moodly/features/meals_recommendations/data/models/meals_category_model.dart';
import '../../domain/enums/mood_type.dart';

class MoodLocalDataSource {
  Future<MealsCategoryModel> getMoodData({required MoodType mood}) async {
    final String moodName = moodTypeToString(mood);

    final String jsonString = await rootBundle.loadString(
      'assets/data/moods/$moodName.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    final moodData = decoded[moodName];

    return MealsCategoryModel.fromJson(moodData);
  }
}
