// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
  videoUrl: json['video_url'] as String,
  coverUrl: json['cover_url'] as String,
  category: json['category'] as String,
  title: json['title'] as String,
  duration: (json['duration'] as num).toDouble(),
  id: json['id'] as String,
  createdAt: json['created_at'] as String,
  description: json['description'] as String,
);

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'cover_url': instance.coverUrl,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'video_url': instance.videoUrl,
      'description': instance.description,
    };
