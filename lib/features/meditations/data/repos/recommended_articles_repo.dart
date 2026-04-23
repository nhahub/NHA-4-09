import 'package:moodly/features/meditations/data/services/recommended_articles_service.dart';

import '../models/article_model.dart';

class RecommendedArticlesRepo {
  final RecommendedArticlesService _recommendedArticlesService;

  RecommendedArticlesRepo({
    required RecommendedArticlesService recommendedArticlesService,
  }) : _recommendedArticlesService = recommendedArticlesService;

  Future<List<ArticleModel>> getRecommendedArticles() async {
    return await _recommendedArticlesService.getRecommendedArticles();
  }
}
