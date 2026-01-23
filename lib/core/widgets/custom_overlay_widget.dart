import 'dart:ui';
import 'package:flutter/material.dart';
import 'premium_popup.dart';

class CustomOverlayWidget extends StatelessWidget {
  final double height;
  final Widget? child;
  final double? padding;
  const CustomOverlayWidget({
    super.key,
    required this.height,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
          child: child,
        ),
        // Blur + overlay
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: double.infinity,
              height: height,
              color: Colors.black.withAlpha(0),
            ),
          ),
        ),
        const PremiumPopup(),
      ],
    );
  }
}
