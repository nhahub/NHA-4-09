import 'package:json_annotation/json_annotation.dart';
import '../../../../core/models/media_model.dart';

part 'audio_model.g.dart';

@JsonSerializable()
class AudioModel extends MediaModel {
  @JsonKey(name: 'audio_url')
  final String audioUrl;

  const AudioModel({
    required this.audioUrl,
    required super.coverUrl,
    required super.category,
    required super.title,
    required super.duration,
    required super.id,
    required super.createdAt,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) =>
      _$AudioModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AudioModelToJson(this);
}
