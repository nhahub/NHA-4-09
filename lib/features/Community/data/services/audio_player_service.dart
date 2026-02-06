import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/errors/audio_exceptions.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();

  AudioPlayer get player => _player;

  Future<void> init(String url) async {
    try {
      final session = await AudioSession.instance;
      await session.configure(const AudioSessionConfiguration.music());
    } catch (_) {
      throw const AudioSessionException("Failed to initialize audio session");
    }

    try {
      await _player.setUrl(url);
    } catch (_) {
      throw const AudioLoadException("Failed to load audio source");
    }
  }

  void dispose() {
    _player.dispose();
  }

  Future<void> play() => _player.play();
  Future<void> pause() => _player.pause();
  Future<void> seek(Duration d) => _player.seek(d);
}
