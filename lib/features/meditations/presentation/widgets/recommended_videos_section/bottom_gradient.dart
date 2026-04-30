import 'package:flutter/material.dart';

class BottomGradient extends StatelessWidget {
  const BottomGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha: 0.20),
            Colors.black.withValues(alpha: 0.60),
          ],
          stops: const [0.4, 0.7, 1.0],
        ),
      ),
    );
  }
}