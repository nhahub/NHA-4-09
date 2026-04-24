import 'package:moodly/features/meditations/data/models/article_model.dart';

class DummyArticles {
  static List<ArticleModel> dummyArticles = List.generate(
    6,
    (index) => const ArticleModel(
      id: "",
      title: "",
      content: "",
      authorName: "",
      authorImage: "",
      articleImage: "",
      category: "",
      publishedAt: "",
    ),
  );
}
