import '../article_model.dart';

class DummyArticles {
  static List<ArticleModel> dummyArticles = List.generate(
    6,
    (index) => ArticleModel(
      id: "",
      title: "",
      content: "",
      authorName: "",
      authorImage: "",
      articleImage: "",
      category: "",
      publishedAt: DateTime.now(),
    ),
  );
}
