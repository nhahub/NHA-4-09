import 'package:moodly/features/meditations/data/models/article_model.dart';

import '../mock_data/recommended_articles_data.dart';

class RecommendedArticlesService {
  Future<List<ArticleModel>> getRecommendedArticles() async {
    return recommendedArticlesData;
  }
}
