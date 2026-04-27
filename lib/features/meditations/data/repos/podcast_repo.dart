import '../models/audio_model.dart';
import '../services/podcast_service.dart';

class PodcastRepo {
  final PodcastService _podcastService;
  PodcastRepo({required PodcastService podcastService})
    : _podcastService = podcastService;

  Future<List<AudioModel>> getPodcastTracks() async {
    final List<AudioModel> podcastTracks = await _podcastService
        .getPodcastTracks();
    return podcastTracks;
  }
}
