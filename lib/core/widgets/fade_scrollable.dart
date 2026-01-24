import 'package:flutter/material.dart';
import '../enums/fade_position.dart';

class FadeScrollable extends StatelessWidget {
  final Widget child;
  final double fadeHeightFromTop;
  final double fadeHeightFromBottom;
  final FadePosition fadePosition;
  final Color backgroundColor;

  const FadeScrollable({
    super.key,
    required this.child,
    this.fadeHeightFromTop = 80,
    this.fadeHeightFromBottom = 80,
    this.fadePosition = FadePosition.both,
    this.backgroundColor = Colors.white,
  });

  bool get _showTop =>
      fadePosition == FadePosition.top || fadePosition == FadePosition.both;

  bool get _showBottom =>
      fadePosition == FadePosition.bottom || fadePosition == FadePosition.both;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,

        /// Top fade
        if (_showTop)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: fadeHeightFromTop,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.55, 1.0],
                    colors: [backgroundColor, backgroundColor.withAlpha(0)],
                  ),
                ),
              ),
            ),
          ),

        /// Bottom fade
        if (_showBottom)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: fadeHeightFromBottom,
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [backgroundColor, backgroundColor.withAlpha(0)],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
