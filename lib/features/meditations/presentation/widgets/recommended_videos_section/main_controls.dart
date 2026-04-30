import 'package:flutter/material.dart';

import 'control_button.dart';

class MainControls extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlayPause;
  final VoidCallback onSkipForward;
  final VoidCallback onSkipBackward;

  const MainControls({
    super.key,
    required this.isPlaying,
    required this.onPlayPause,
    required this.onSkipForward,
    required this.onSkipBackward,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 24,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Skip backward
        ControlButton(
          onTap: onSkipBackward,
          child: const Icon(Icons.replay_10_rounded, size: 24),
        ),

        /// Play / Pause
        ControlButton(
          size: 66,
          isActive: true,
          activeColor: const Color(0xFF3DBE7E),
          onTap: onPlayPause,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF3DBE7E).withValues(alpha: 0.4),
              blurRadius: 20,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          child: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),

        /// Skip forward
        ControlButton(
          onTap: onSkipForward,
          child: const Icon(Icons.forward_10_rounded, size: 24),
        ),
      ],
    );
  }
}
