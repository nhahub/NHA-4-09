import 'package:flutter/material.dart';

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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SkipButton(
          icon: Icons.replay_10_rounded,
          onTap: onSkipBackward,
        ),
        const SizedBox(width: 24),
        _PlayPauseButton(
          isPlaying: isPlaying,
          onTap: onPlayPause,
        ),
        const SizedBox(width: 24),
        _SkipButton(
          icon: Icons.forward_10_rounded,
          onTap: onSkipForward,
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Play / Pause button
// ---------------------------------------------------------------------------

class _PlayPauseButton extends StatefulWidget {
  final bool isPlaying;
  final VoidCallback onTap;

  const _PlayPauseButton({required this.isPlaying, required this.onTap});

  @override
  State<_PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<_PlayPauseButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  double get _scale {
    if (_isPressed) return 0.90;
    if (_isHovered) return 1.12;
    return 1.0;
  }

  double get _shadowBlur => _isPressed ? 10 : (_isHovered ? 32 : 20);
  double get _shadowSpread => _isPressed ? 2 : (_isHovered ? 8 : 4);
  double get _shadowAlpha => _isPressed ? 0.25 : (_isHovered ? 0.55 : 0.40);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              color: _isHovered
                  ? const Color(0xFF34A96D) // slightly darker green on hover
                  : const Color(0xFF3DBE7E),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF3DBE7E).withValues(alpha: _shadowAlpha),
                  blurRadius: _shadowBlur,
                  spreadRadius: _shadowSpread / 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              widget.isPlaying
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Skip buttons (backward / forward)
// ---------------------------------------------------------------------------

class _SkipButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SkipButton({required this.icon, required this.onTap});

  @override
  State<_SkipButton> createState() => _SkipButtonState();
}

class _SkipButtonState extends State<_SkipButton> {
  bool _isPressed = false;
  bool _isHovered = false;

  double get _scale {
    if (_isPressed) return 0.88;
    if (_isHovered) return 1.12;
    return 1.0;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onTap();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedScale(
          scale: _scale,
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: _isHovered
                  ? const Color(0xFFE2E2E2) // visibly darker on hover
                  : const Color(0xFFF0F0F0),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                      alpha: _isHovered ? 0.14 : 0.06),
                  blurRadius: _isHovered ? 14 : 6,
                  spreadRadius: _isHovered ? 1 : 0,
                  offset: Offset(0, _isHovered ? 4 : 2),
                ),
              ],
            ),
            child: Icon(
              widget.icon,
              color: const Color(0xFF222222),
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
