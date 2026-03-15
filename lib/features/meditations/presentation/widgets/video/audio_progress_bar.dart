import 'package:flutter/material.dart';

class AudioProgressBar extends StatelessWidget {
  final int elapsedSeconds;
  final int totalSeconds;
  final ValueChanged<int> onSeek;

  const AudioProgressBar({
    super.key,
    required this.elapsedSeconds,
    required this.totalSeconds,
    required this.onSeek,
  });

  String _format(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(1, '0')}:${s.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final progress =
        totalSeconds > 0 ? elapsedSeconds / totalSeconds : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 4,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
              activeTrackColor: const Color(0xFF3DBE7E),
              inactiveTrackColor: const Color(0xFFE0E0E0),
              thumbColor: const Color(0xFF3DBE7E),
              overlayColor: const Color(0xFF3DBE7E).withValues(alpha: 0.20),
            ),
            child: Slider(
              value: progress.clamp(0.0, 1.0),
              onChanged: (value) {
                final targetSeconds = (value * totalSeconds).round();
                onSeek(targetSeconds);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _format(elapsedSeconds),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF888888),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _format(totalSeconds),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF888888),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
