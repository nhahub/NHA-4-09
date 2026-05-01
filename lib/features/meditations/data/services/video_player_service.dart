import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerService {
  VideoPlayerController? _controller;
  ChewieController? _chewie;

  ChewieController? get chewie => _chewie;

  Future<void> init(String url, VoidCallback onUpdate) async {
    _controller = VideoPlayerController.networkUrl(Uri.parse(url));
    await _controller!.initialize();

    _chewie = ChewieController(
      videoPlayerController: _controller!,
      autoPlay: false,
      looping: false,
      showControls: false,
    );

    _controller!.addListener(onUpdate);
  }

  bool get isPlaying => _controller?.value.isPlaying ?? false;

  Duration get position => _controller?.value.position ?? Duration.zero;

  Duration get duration => _controller?.value.duration ?? Duration.zero;

  Future<void> play() async => _controller?.play();

  Future<void> pause() async => _controller?.pause();

  Future<void> seek(Duration d) async => _controller?.seekTo(d);

  Future<void> setVolume(bool muted) async =>
      _controller?.setVolume(muted ? 0 : 1);

  Future<void> setSpeed(double speed) async =>
      _controller?.setPlaybackSpeed(speed);

  void dispose() {
    _controller?.dispose();
    _chewie?.dispose();
  }

  void toggleFullscreen() {
    _chewie?.enterFullScreen();
  }
}
