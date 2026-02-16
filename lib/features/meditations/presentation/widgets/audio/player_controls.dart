import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import 'controls_icon.dart';

class PlayerControls extends StatelessWidget {
  final AudioPlayer player;

  const PlayerControls({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        spacing: 25,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Restart
          ControlsIcon(
            iconPath: AppAssets.repeatIcon,
            width: 20,
            height: 20,
            onTap: () async {
              await player.seek(Duration.zero);
              await player.play();
            },
          ),
          // Rewind 10s
          ControlsIcon(
            iconPath: AppAssets.previousIcon,
            onTap: () {
              final newPosition = player.position - const Duration(seconds: 10);
              player.seek(
                newPosition >= Duration.zero ? newPosition : Duration.zero,
              );
            },
          ),
          // Play/Pause
          StreamBuilder<PlayerState>(
            stream: player.playerStateStream,
            builder: (context, snapshot) {
              final playing = snapshot.data?.playing ?? false;

              return ElevatedButton(
                onPressed: () {
                  playing ? player.pause() : player.play();
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                  backgroundColor: AppColors.lightGreen,
                ),
                child: ControlsIcon(
                  color: Colors.white,
                  height: 20,
                  iconPath: playing ? AppAssets.pauseIcon : AppAssets.playIcon,
                  onTap: () {
                    playing ? player.pause() : player.play();
                  },
                ),
              );
            },
          ),
          // Forward 10s
          ControlsIcon(
            iconPath: AppAssets.nextIcon,
            onTap: () {
              final duration = player.duration ?? Duration.zero;
              final newPosition = player.position + const Duration(seconds: 10);
              player.seek(newPosition <= duration ? newPosition : duration);
            },
          ),
          // Shuffle
          ControlsIcon(
            iconPath: AppAssets.shuffleIcon,
            onTap: () async {
              await player.setShuffleModeEnabled(true);
            },
          ),
        ],
      ),
    );
  }
}
