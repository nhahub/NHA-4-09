import 'dart:convert';
import '../models/app_rating_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/cache_helper.dart';

class AppRatingLocalService {
  /// Save rating locally
  Future<void> cacheUserRating(AppRatingModel model) async {
    final jsonString = jsonEncode(model.toJson());
    await CacheHelper.set(key: kAppUserRating, value: jsonString);
  }

  /// Get cached rating
  AppRatingModel? getCachedUserRating() {
    final data = CacheHelper.getString(key: kAppUserRating);

    if (data == null) return null;

    return AppRatingModel.fromJson(Map<String, dynamic>.from(_decode(data)));
  }

  // helper decode
  Map<String, dynamic> _decode(String data) {
    return const JsonDecoder().convert(data);
  }
}
