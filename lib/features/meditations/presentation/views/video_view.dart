import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/data/models/meditation_session.dart';
import 'package:moodly/features/meditations/presentation/widgets/video/about_session_card.dart';
import 'package:moodly/features/meditations/presentation/widgets/video/audio_progress_bar.dart';
import 'package:moodly/features/meditations/presentation/widgets/video/main_controls.dart';
import 'package:moodly/features/meditations/presentation/widgets/video/secondary_controls.dart';
import 'package:moodly/features/meditations/presentation/widgets/video/session_details_card.dart';
import 'package:moodly/features/meditations/presentation/widgets/video/session_header.dart';

class VideoView extends StatefulWidget {
  final MeditationSession session;

  const VideoView({super.key, this.session = kDefaultMeditationSession});

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late final ValueNotifier<int> _elapsedSeconds;
  late final ValueNotifier<bool> _isPlaying;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _elapsedSeconds = ValueNotifier<int>(85); // start at 1:25 to match ref
    _isPlaying = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _elapsedSeconds.dispose();
    _isPlaying.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = _elapsedSeconds.value + 1;
      if (next >= widget.session.durationSeconds) {
        _elapsedSeconds.value = widget.session.durationSeconds;
        _pausePlayback();
      } else {
        _elapsedSeconds.value = next;
      }
    });
  }

  void _pausePlayback() {
    _timer?.cancel();
    _isPlaying.value = false;
  }

  void _togglePlayPause() {
    if (_isPlaying.value) {
      _pausePlayback();
    } else {
      _isPlaying.value = true;
      _startTimer();
    }
  }

  void _handleImageTap() {
    // Tap image while playing → show pause icon overlay (handled in SessionHeader)
    // Toggle play/pause on tap.
    _togglePlayPause();
  }

  void _skipForward() {
    final next = (_elapsedSeconds.value + 10).clamp(
      0,
      widget.session.durationSeconds,
    );
    _elapsedSeconds.value = next;
  }

  void _skipBackward() {
    final next = (_elapsedSeconds.value - 10).clamp(
      0,
      widget.session.durationSeconds,
    );
    _elapsedSeconds.value = next;
  }

  void _handleSeek(int seconds) {
    _elapsedSeconds.value = seconds.clamp(0, widget.session.durationSeconds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: _buildAppBar(context),
      body: ValueListenableBuilder<bool>(
        valueListenable: _isPlaying,
        builder: (context, isPlaying, _) {
          return ValueListenableBuilder<int>(
            valueListenable: _elapsedSeconds,
            builder: (context, elapsed, _) {
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Session Header
                    SessionHeader(
                      session: widget.session,
                      isPlaying: isPlaying,
                      onImageTap: _handleImageTap,
                    ),

                    const SizedBox(height: 18),

                    // 2. Audio Progress Bar
                    AudioProgressBar(
                      elapsedSeconds: elapsed,
                      totalSeconds: widget.session.durationSeconds,
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
                    const SecondaryControls(),

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
                    AboutSessionCard(session: widget.session),

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
                    SessionDetailsCard(session: widget.session),

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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF7F8FA),
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 52,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF1A1A1A),
            size: 20,
          ),
          tooltip: 'Back',
        ),
      ),
      title: const Text(
        'Meditation',
        style: TextStyle(
          color: Color(0xFF1A1A1A),
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz_rounded,
              color: Color(0xFF1A1A1A),
              size: 24,
            ),
            tooltip: 'More',
          ),
        ),
      ],
    );
  }
}
