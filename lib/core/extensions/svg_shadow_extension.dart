import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helpers/alpha_from_percent.dart';

extension SvgAssetShadow on String {
  Widget svgWithShadow({
    double size = 60,
    Color color = Colors.white,
    Offset offset = const Offset(0, 2),
    Color shadowColor = Colors.black,
    int percentage = 25,
    BoxFit fit = BoxFit.contain,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.translate(
          offset: offset,
          child: SvgPicture.asset(
            this,
            width: size,
            fit: fit,
            colorFilter: ColorFilter.mode(
              shadowColor.withAlpha(alphaFromPercentage(percentage)),
              BlendMode.srcIn,
            ),
          ),
        ),
        SvgPicture.asset(
          this,
          width: size,
          fit: fit,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
      ],
    );
  }
}
