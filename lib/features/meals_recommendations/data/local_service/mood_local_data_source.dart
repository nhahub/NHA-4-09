import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/mood_food_model.dart';
import '../../domain/enums/mood_type.dart';

import '../../domain/mappers/mood_type_mapper.dart';

class MoodLocalDataSource {
  Future<MoodFoodModel> getMoodData(MoodType mood) async {
    final String moodName = moodTypeToString(mood);

    final String jsonString = await rootBundle.loadString(
      'assets/data/moods/$moodName.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    final moodData = decoded[moodName];

    return MoodFoodModel.fromJson(moodData);
  }
}
