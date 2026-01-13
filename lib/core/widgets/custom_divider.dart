import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.horizontalPadding, this.color});
  final double? horizontalPadding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2,
      width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey[500]!.withAlpha(255 * 0.01.toInt())],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
