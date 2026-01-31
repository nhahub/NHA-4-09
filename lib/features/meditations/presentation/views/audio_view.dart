import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/meditations/domain/audio_entity.dart';
import 'package:moodly/features/meditations/presentation/widgets/audio/audio_progress_bar.dart';
import 'package:moodly/features/meditations/presentation/widgets/audio/player_controls.dart';
import 'package:moodly/features/meditations/presentation/widgets/audio/audio_info.dart';

class AudioView extends StatefulWidget {
  final AudioEntity audioEntity;

  const AudioView({super.key, required this.audioEntity});

  @override
  State<AudioView> createState() => _AudioViewState();
}

class _AudioViewState extends State<AudioView> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    _audioPlayer = AudioPlayer();

    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());

    try {
      await _audioPlayer.setUrl(widget.audioEntity.audioUrl);
    } catch (e) {
      debugPrint("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Now playing"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: kAppSectionSpacing),
                AudioInfo(audioEntity: widget.audioEntity),
                const SizedBox(height: 30),
                AudioProgressBar(player: _audioPlayer),
                const SizedBox(height: 10),
                PlayerControls(player: _audioPlayer),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
