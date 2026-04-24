import '../../../../core/constants/constants.dart';
import '../../../../core/services/local_cache_service.dart';
import '../models/article_model.dart';

class RecommendedArticlesLocalService {
  final LocalCacheService<ArticleModel> _localCacheService;

  RecommendedArticlesLocalService({
    required LocalCacheService<ArticleModel> localCacheService,
  }) : _localCacheService = localCacheService;

  Future<List<ArticleModel>?> getRecommendedArticles() async {
    final List<ArticleModel>? list = await _localCacheService.getList(
      key: kRecommendedArticles,
      boxName: kRecommendedArticlesBox,
    );
    if (list == null) {
      return null;
    }
    return list;
  }

  Future<void> cacheRecommendedArticles({
    required List<ArticleModel> recommendedArticles,
  }) async {
    await _localCacheService.saveList(
      key: kRecommendedArticles,
      boxName: kRecommendedArticlesBox,
      list: recommendedArticles,
    );
  }

  Future<void> clearRecommendedArticles() async {
    await _localCacheService.clear(
      key: kRecommendedArticles,
      boxName: kRecommendedArticlesBox,
    );
  }

  Future<void> saveMood(String mood) async {
    await _localCacheService.save(
      key: kCachedMood,
      boxName: kRecommendedArticlesBox,
      value: mood,
    );
  }

  Future<String?> getCachedMood() async {
    return await _localCacheService.get(
      key: kCachedMood,
      boxName: kRecommendedArticlesBox,
    );
  }
}
