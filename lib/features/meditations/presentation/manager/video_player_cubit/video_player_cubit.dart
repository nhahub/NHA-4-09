import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:video_player/video_player.dart';
part 'video_player_state.dart';

class VideoPlayerCubit extends Cubit<VideoPlayerState> {
  VideoPlayerCubit() : super(const VideoPlayerState());

  VideoPlayerController? videoController;
  ChewieController? chewieController;

  Future<void> init({required String url}) async {
    try {
      videoController = VideoPlayerController.networkUrl(Uri.parse(url));
      await videoController!.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoController!,
        autoPlay: false,
        looping: false,
        showControls: false,
      );

      videoController!.addListener(_listener);

      emit(
        state.copyWith(
          isInitialized: true,
          isPlaying: true,
          duration: videoController!.value.duration.inSeconds,
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: ApiErrorHandler.handle(error: e).message));
    }
  }

  void _listener() {
    if (videoController == null) return;

    emit(
      state.copyWith(
        isPlaying: videoController!.value.isPlaying,
        position: videoController!.value.position.inSeconds,
      ),
    );
  }

  void togglePlayPause() {
    if (videoController == null) return;

    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
  }

  void skipForward() {
    if (videoController == null) return;

    final position = videoController!.value.position;
    videoController!.seekTo(position + const Duration(seconds: 10));
  }

  void skipBackward() {
    if (videoController == null) return;

    final position = videoController!.value.position;
    videoController!.seekTo(position - const Duration(seconds: 10));
  }

  void seek({required int seconds}) {
    if (videoController == null) return;

    videoController!.seekTo(Duration(seconds: seconds));
  }

  void toggleVolume() {
    if (videoController == null) return;

    final newMuted = !state.isMuted;

    videoController!.setVolume(newMuted ? 0.0 : 1.0);

    emit(state.copyWith(isMuted: newMuted));
  }

  void toggleFullscreen() {
    chewieController?.enterFullScreen();
  }

  void changeSpeed({required double speed}) {
    if (videoController == null) return;

    videoController!.setPlaybackSpeed(speed);

    emit(state.copyWith(speed: speed));
  }

  @override
  Future<void> close() {
    videoController?.dispose();
    chewieController?.dispose();
    return super.close();
  }
}
