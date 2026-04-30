import 'package:flutter/material.dart';

class ControlButton extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final VoidCallback onTap;
  final Color? activeColor;
  final Color? inactiveColor;
  final double size;
  final List<BoxShadow>? boxShadow;

  const ControlButton({
    super.key,
    required this.child,
    this.isActive = false,
    this.boxShadow,
    required this.onTap,
    this.activeColor,
    this.inactiveColor,
    this.size = 52,
  });

  @override
  State<ControlButton> createState() => _ControlButtonState();
}

class _ControlButtonState extends State<ControlButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHighlightChanged: (value) {
        setState(() => _isPressed = value);
      },
      borderRadius: BorderRadius.circular(100),
      child: AnimatedScale(
        scale: _isPressed ? 0.92 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isActive
                ? (widget.activeColor ?? const Color(0xFFCCEFDF))
                : (widget.inactiveColor ?? const Color(0xFFF2F2F2)),
            boxShadow:
                widget.boxShadow ??
                [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
          ),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
