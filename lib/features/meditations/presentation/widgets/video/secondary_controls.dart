import 'package:flutter/material.dart';

/// A toggle-able circular button used in the secondary controls row.
class _SecondaryButton extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final VoidCallback onTap;

  const _SecondaryButton({
    required this.child,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<_SecondaryButton> {
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
              color: widget.isActive
                  ? const Color(0xFFCCEFDF)
                  : (_isHovered
                      ? const Color(0xFFE4E4E4)
                      : const Color(0xFFF2F2F2)),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(
                      alpha: _isHovered ? 0.13 : 0.06),
                  blurRadius: _isHovered ? 14 : 6,
                  spreadRadius: _isHovered ? 1 : 0,
                  offset: Offset(0, _isHovered ? 4 : 2),
                ),
              ],
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class SecondaryControls extends StatefulWidget {
  const SecondaryControls({super.key});

  @override
  State<SecondaryControls> createState() => _SecondaryControlsState();
}

class _SecondaryControlsState extends State<SecondaryControls> {
  bool _volumeActive = false;
  bool _speedActive = false;
  bool _fullscreenActive = false;

  // Speed cycle: 0.5x, 1x, 1.5x, 2x
  final List<String> _speeds = ['0.5x', '1x', '1.5x', '2x'];
  int _speedIndex = 1; // default = "1x"

  String get _currentSpeed => _speeds[_speedIndex];

  void _cycleSpeed() {
    setState(() {
      _speedIndex = (_speedIndex + 1) % _speeds.length;
      _speedActive = _speedIndex != 1; // active when not default
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Volume button
        _SecondaryButton(
          isActive: _volumeActive,
          onTap: () => setState(() => _volumeActive = !_volumeActive),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _volumeActive ? Icons.volume_off_rounded : Icons.volume_up_rounded,
              key: ValueKey(_volumeActive),
              color: const Color(0xFF333333),
              size: 22,
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Speed button
        _SecondaryButton(
          isActive: _speedActive,
          onTap: _cycleSpeed,
          child: Center(
            child: Text(
              _currentSpeed,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
          ),
        ),

        const SizedBox(width: 20),

        // Fullscreen button
        _SecondaryButton(
          isActive: _fullscreenActive,
          onTap: () => setState(() => _fullscreenActive = !_fullscreenActive),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Icon(
              _fullscreenActive
                  ? Icons.fullscreen_exit_rounded
                  : Icons.fullscreen_rounded,
              key: ValueKey(_fullscreenActive),
              color: const Color(0xFF333333),
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
