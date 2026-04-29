import 'package:json_annotation/json_annotation.dart';

import 'media_model.dart';

part 'video_model.g.dart';

@JsonSerializable()
class VideoModel extends MediaModel {
  @JsonKey(name: 'video_url')
  final String videoUrl;
  final String description;

  const VideoModel({
    required this.videoUrl,
    required super.coverUrl,
    required super.category,
    required super.title,
    required super.duration,
    required super.id,
    required super.createdAt,
    required this.description,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
