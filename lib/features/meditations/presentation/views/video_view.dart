import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/video_model.dart';
import '../widgets/video/about_session_card.dart';
import '../widgets/video/audio_progress_bar.dart';
import '../widgets/video/main_controls.dart';
import '../widgets/video/secondary_controls.dart';
import '../widgets/video/session_details_card.dart';
import '../widgets/video/session_header.dart';

class VideoView extends StatefulWidget {
  final VideoModel videoModel;

  const VideoView({
    super.key,
    required this.videoModel,
  });

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final ValueNotifier<int> _elapsedSeconds;
  late final ValueNotifier<bool> _isPlaying;

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isVideoInitialized = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _elapsedSeconds = ValueNotifier<int>(0);
    _isPlaying = ValueNotifier<bool>(false);
    _initVideoPlayer(widget.videoModel.videoUrl);
  }

  Future<void> _initVideoPlayer(String videoUrl) async {
    try {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(videoUrl),
      );
      await _videoPlayerController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: true,
        looping: false,
        showControls: false,
      );

      _videoPlayerController!.addListener(() {
        if (mounted) {
          _isPlaying.value = _videoPlayerController!.value.isPlaying;
          _elapsedSeconds.value =
              _videoPlayerController!.value.position.inSeconds;
        }
      });

      setState(() {
        _isVideoInitialized = true;
        _isPlaying.value = true;
      });
    } catch (e) {
      debugPrint("Error loading video: $e");
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _elapsedSeconds.dispose();
    _isPlaying.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_videoPlayerController != null) {
      if (_videoPlayerController!.value.isPlaying) {
        _videoPlayerController!.pause();
      } else {
        _videoPlayerController!.play();
      }
    }
  }

  void _handleImageTap() {
    _togglePlayPause();
  }

  void _skipForward() {
    if (_videoPlayerController != null) {
      final position = _videoPlayerController!.value.position;
      _videoPlayerController!.seekTo(position + const Duration(seconds: 10));
    }
  }

  void _skipBackward() {
    if (_videoPlayerController != null) {
      final position = _videoPlayerController!.value.position;
      _videoPlayerController!.seekTo(position - const Duration(seconds: 10));
    }
  }

  void _handleSeek(int seconds) {
    if (_videoPlayerController != null) {
      _videoPlayerController!.seekTo(Duration(seconds: seconds));
    }
  }

  void _toggleVolume() {
    if (_videoPlayerController != null) {
      setState(() {
        _isMuted = !_isMuted;
        _videoPlayerController!.setVolume(_isMuted ? 0.0 : 1.0);
      });
    }
  }

  void _toggleFullscreen() {
    if (_chewieController != null) {
      _chewieController!.enterFullScreen();
    }
  }

  void _changeSpeed(double speed) {
    if (_videoPlayerController != null) {
      _videoPlayerController!.setPlaybackSpeed(speed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: const BackButtonAppbar(
        title: "Meditation",
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: _isPlaying,
        builder: (context, isPlaying, _) {
          return ValueListenableBuilder<int>(
            valueListenable: _elapsedSeconds,
            builder: (context, elapsed, _) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: kAppHorizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Session Header
                    SessionHeader(
                      videoModel: widget.videoModel,
                      isPlaying: isPlaying,
                      onImageTap: _handleImageTap,
                      videoPlayerWidget: _isVideoInitialized &&
                              _chewieController != null
                          ? Chewie(controller: _chewieController!)
                          : null,
                    ),

                    const SizedBox(height: 18),

                    // 2. Audio Progress Bar
                    AudioProgressBar(
                      elapsedSeconds: elapsed,
                      totalSeconds: _isVideoInitialized
                          ? _videoPlayerController!.value.duration.inSeconds
                          : widget.videoModel.duration.toInt() * 60,
                      onSeek: _handleSeek,
                    ),

                    const SizedBox(height: 20),

                    // 3. Main Controls
                    MainControls(
                      isPlaying: isPlaying,
                      onPlayPause: _togglePlayPause,
                      onSkipForward: _skipForward,
                      onSkipBackward: _skipBackward,
                    ),

                    const SizedBox(height: 20),

                    // 4. Secondary Controls
                    SecondaryControls(
                      isMuted: _isMuted,
                      onVolumeToggle: _toggleVolume,
                      onFullscreenToggle: _toggleFullscreen,
                      onSpeedChanged: _changeSpeed,
                    ),

                    const SizedBox(height: 28),

                    // 5. About Session
                    const Text(
                      'About this session',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    AboutSessionCard(videoModel: widget.videoModel),

                    const SizedBox(height: 24),

                    // 6. Session Details
                    const Text(
                      'Session details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SessionDetailsCard(videoModel: widget.videoModel),

                    const SizedBox(height: 32),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
