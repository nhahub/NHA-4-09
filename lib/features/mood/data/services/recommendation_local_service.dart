import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../../core/helpers/logger.dart';
import '../models/recommendation_model.dart';

class RecommendationLocalService {
  Future<RecommendationModel> getRecommendationData({
    required String moodName,
  }) async {
    Logger.log('moodName: $moodName');
    final String jsonString = await rootBundle.loadString(
      'assets/data/recommendations/${moodName}_recommendations.json',
    );
    final Map<String, dynamic> decoded = json.decode(jsonString);

    final recommendationData = decoded[moodName];
    return RecommendationModel.fromJson(recommendationData);
  }
}
