import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/theming/app_assets.dart';

class CardDot extends StatelessWidget {
  const CardDot({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppAssets.cardDotIcon, width: 14);
  }
}
