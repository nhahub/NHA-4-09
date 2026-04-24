import 'package:json_annotation/json_annotation.dart';
part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final String id;
  final String title;
  final String content;
  final String category;

  @JsonKey(name: 'author_name')
  final String authorName;

  @JsonKey(name: 'author_image')
  final String authorImage;

  @JsonKey(name: 'article_image')
  final String articleImage;

  @JsonKey(name: 'published_at')
  final String publishedAt;

  const ArticleModel({
    required this.id,
    required this.title,
    required this.content,
    required this.authorName,
    required this.authorImage,
    required this.articleImage,
    required this.category,
    required this.publishedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
