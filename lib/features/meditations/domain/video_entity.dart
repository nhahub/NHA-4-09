import '../../../core/entities/media_entity.dart';

class VideoEntity extends MediaEntity {
  final String videoUrl;

  const VideoEntity({
    required this.videoUrl,
    required super.coverUrl,
    required super.category,
    required super.title,
    required super.duration,
  });
}
