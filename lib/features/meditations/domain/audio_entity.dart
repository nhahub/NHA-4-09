import 'package:moodly/core/entities/media_entity.dart';

class AudioEntity extends MediaEntity {
  final String audioUrl;

  const AudioEntity({
    required this.audioUrl,
    required super.coverUrl,
    required super.category,
    required super.title,
    required super.duration,
  });
}
