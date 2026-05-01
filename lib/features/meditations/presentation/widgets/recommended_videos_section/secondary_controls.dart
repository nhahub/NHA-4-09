import 'package:flutter/material.dart';
import 'control_button.dart';

import '../../../../../core/theming/app_styles.dart';

class SecondaryControls extends StatelessWidget {
  final bool isMuted;
  final bool isFullscreen;
  final double speed;

  final VoidCallback onVolumeToggle;
  final VoidCallback onFullscreenToggle;
  final ValueChanged<double> onSpeedChanged;

  const SecondaryControls({
    super.key,
    required this.isMuted,
    required this.isFullscreen,
    required this.speed,
    required this.onVolumeToggle,
    required this.onFullscreenToggle,
    required this.onSpeedChanged,
  });

  static const List<double> _speeds = [0.5, 1.0, 1.5, 2.0];

  double _getNextSpeed(double current) {
    final index = _speeds.indexOf(current);
    return _speeds[(index + 1) % _speeds.length];
  }

  @override
  Widget build(BuildContext context) {
    final speedLabel = "${speed}x";

    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Volume
        ControlButton(
          isActive: isMuted,
          onTap: onVolumeToggle,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
              key: ValueKey(isMuted),
              color: const Color(0xFF333333),
              size: 22,
            ),
          ),
        ),

        /// Speed
        ControlButton(
          isActive: speed != 1.0,
          onTap: () {
            final next = _getNextSpeed(speed);
            onSpeedChanged(next);
          },
          child: Center(child: Text(speedLabel, style: AppStyles.semiBold13)),
        ),

        /// Fullscreen
        ControlButton(
          isActive: isFullscreen,
          onTap: onFullscreenToggle,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              isFullscreen
                  ? Icons.fullscreen_exit_rounded
                  : Icons.fullscreen_rounded,
              key: ValueKey(isFullscreen),
              color: const Color(0xFF333333),
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
