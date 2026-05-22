// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
  id: json['id'] as String,
  userId: json['user_id'] as String,
  content: json['content'] as String,
  imageUrls:
      (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  createdAt: DateTime.parse(json['created_at'] as String),
  loveCount: (json['love_count'] as num?)?.toInt() ?? 0,
  commentsCount: (json['comments_count'] as num?)?.toInt() ?? 0,
  sharesCount: (json['shares_count'] as num?)?.toInt() ?? 0,
  isLikedByCurrentUser: json['is_liked'] as bool? ?? false,
);

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'content': instance.content,
  'image_urls': instance.imageUrls,
  'created_at': instance.createdAt.toIso8601String(),
  'love_count': instance.loveCount,
  'comments_count': instance.commentsCount,
  'shares_count': instance.sharesCount,
  'is_liked': instance.isLikedByCurrentUser,
};
