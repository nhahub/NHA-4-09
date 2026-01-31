import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ControlsIcon extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final Color color;

  const ControlsIcon({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.height,
    this.width,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SvgPicture.asset(
        iconPath,
        height: height,
        width: width,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
