import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../Community/data/services/audio_player_service.dart';
import '../../../domain/audio_entity.dart';
import 'audio_info.dart';
import 'audio_progress_bar.dart';
import 'player_controls.dart';

class AudioViewBody extends StatelessWidget {
  const AudioViewBody({
    super.key,
    required this.audioService,
    required this.audioEntity,
  });

  final AudioPlayerService audioService;
  final AudioEntity audioEntity;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: kAppSectionSpacing),
              AudioInfo(audioEntity: audioEntity),
              const SizedBox(height: 30),
              AudioProgressBar(player: audioService.player),
              const SizedBox(height: 10),
              PlayerControls(player: audioService.player),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
