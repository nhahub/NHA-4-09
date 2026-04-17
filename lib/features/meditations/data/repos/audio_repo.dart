import '../models/audio_model.dart';
import '../services/audio_service.dart';

class AudioRepo {
  final AudioService _audioService;
  AudioRepo({required AudioService audioService})
    : _audioService = audioService;

  Future<List<AudioModel>> getASMRTracks() async {
    final List<AudioModel> asmrTracks = await _audioService.getASMRTracks();
    return asmrTracks;
  }

  Future<List<AudioModel>> getPodcastTracks() async {
    final List<AudioModel> podcastTracks = await _audioService
        .getPodcastTracks();
    return podcastTracks;
  }
}
