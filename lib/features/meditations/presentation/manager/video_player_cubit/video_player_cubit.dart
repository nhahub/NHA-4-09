import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import '../../../data/services/video_player_service.dart';
part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  final VideoPlayerService _service;

  VideoPlayerCubit({required VideoPlayerService service})
    : _service = service,
      super(const VideoPlayerState());

  Future<void> init({required String url}) async {
    try {
      await _service.init(url, _listener);

      emit(
        state.copyWith(
          isInitialized: true,
          duration: _service.duration.inSeconds,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: ApiErrorHandler.handle(error: e).message));
    }
  }

  void _listener() {
    emit(
      state.copyWith(
        isPlaying: _service.isPlaying,
        position: _service.position.inSeconds,
      ),
    );
  }

  void togglePlayPause() {
    _service.isPlaying ? _service.pause() : _service.play();
  }

  void skipForward() {
    _service.seek(_service.position + const Duration(seconds: 10));
  }

  void skipBackward() {
    _service.seek(_service.position - const Duration(seconds: 10));
  }

  void seek({required int seconds}) {
    _service.seek(Duration(seconds: seconds));
  }

  void toggleVolume() {
    final newMuted = !state.isMuted;
    _service.setVolume(newMuted);
    emit(state.copyWith(isMuted: newMuted));
  }

  void changeSpeed({required double speed}) {
    _service.setSpeed(speed);
    emit(state.copyWith(speed: speed));
  }

  void toggleFullscreen() {
    _service.toggleFullscreen();
  }

  ChewieController? get chewieController => _service.chewie;

  @override
  Future<void> close() {
    _service.dispose();
    return super.close();
  }
}
