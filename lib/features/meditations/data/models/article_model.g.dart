// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  authorName: json['author_name'] as String,
  authorImage: json['author_image'] as String,
  articleImage: json['article_image'] as String,
  category: json['category'] as String,
  publishedAt: DateTime.parse(json['published_at'] as String),
);

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'category': instance.category,
      'author_name': instance.authorName,
      'author_image': instance.authorImage,
      'article_image': instance.articleImage,
      'published_at': instance.publishedAt.toIso8601String(),
    };
