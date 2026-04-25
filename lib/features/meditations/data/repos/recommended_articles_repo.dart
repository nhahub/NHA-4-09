import 'package:moodly/core/extensions/string_extensions.dart';
import 'package:moodly/core/helpers/logger.dart';
import 'package:moodly/features/meditations/data/services/recommended_articles_remote_service.dart';

import '../../../mood/data/services/mood_local_service.dart';
import '../models/article_model.dart';
import '../services/recommended_articles_local_service.dart';

class RecommendedArticlesRepo {
  final RecommendedArticlesRemoteService _recommendedArticlesRemoteService;
  final RecommendedArticlesLocalService _recommendedArticlesLocalService;
  final MoodLocalService _moodLocalService;

  RecommendedArticlesRepo({
    required RecommendedArticlesRemoteService recommendedArticlesRemoteService,
    required RecommendedArticlesLocalService recommendedArticlesLocalService,
    required MoodLocalService moodLocalService,
  }) : _recommendedArticlesRemoteService = recommendedArticlesRemoteService,
       _recommendedArticlesLocalService = recommendedArticlesLocalService,
       _moodLocalService = moodLocalService;

  Future<List<ArticleModel>> getRecommendedArticles() async {
    // Get current mood
    final String currentMood =
        _moodLocalService.getSelectedDailyMood() ?? "calm";
    Logger.log(currentMood);

    // Get cached mood
    final String? cachedMood = await _recommendedArticlesLocalService
        .getCachedMood();

    Logger.log(cachedMood ?? "null");

    // If cached mood is not equal to current mood remove cached data
    if (cachedMood != currentMood) {
      await _recommendedArticlesLocalService.clearRecommendedArticles();
      await _recommendedArticlesLocalService.saveMood(currentMood);
    }

    // Try to get data from cache first
    final List<ArticleModel>? recommendedCachedArticles =
        await _recommendedArticlesLocalService.getRecommendedArticles();

    if (recommendedCachedArticles != null &&
        recommendedCachedArticles.isNotEmpty) {
      return recommendedCachedArticles;
    }
    //  No data in cache, fetch from remote
    final List<ArticleModel> recommendedArticles =
        await _recommendedArticlesRemoteService.getRecommendedArticles(
          mood: currentMood.capitalize(),
        );

    // Save data to cache
    await _recommendedArticlesLocalService.cacheRecommendedArticles(
      recommendedArticles: recommendedArticles,
    );

    return recommendedArticles;
  }
}
