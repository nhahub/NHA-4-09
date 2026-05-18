// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
  id: json['id'] as String,
  postId: json['post_id'] as String,
  userId: json['user_id'] as String,
  parentId: json['parent_id'] as String?,
  content: json['content'] as String,
  createdAt: CommentModel._dateTimeFromJson(json['created_at'] as String),
  likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
  repliesCount: (json['replies_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_id': instance.postId,
      'user_id': instance.userId,
      'parent_id': instance.parentId,
      'content': instance.content,
      'created_at': CommentModel._dateTimeToJson(instance.createdAt),
      'likes_count': instance.likesCount,
      'replies_count': instance.repliesCount,
    };
