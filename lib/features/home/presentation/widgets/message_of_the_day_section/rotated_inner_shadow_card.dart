import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import 'message_of_the_day_section.dart';

class RotatedInnerShadowCard extends StatelessWidget {
  const RotatedInnerShadowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: MessageOfTheDaySection.rotationAngle,
      child: Transform.translate(
        offset: MessageOfTheDaySection.translateOffset,
        child: InnerShadow(
          shadows: [
            Shadow(
              color: Colors.white.withAlpha(alphaFromPercentage(60)),
              offset: const Offset(0, 1.34),
              blurRadius: 1,
            ),
          ],
          child: Container(
            height: MessageOfTheDaySection.cardHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MessageOfTheDaySection.cardRadius,
              ),
              color: AppColors.borderButton.withAlpha(alphaFromPercentage(12)),
            ),
          ),
        ),
      ),
    );
  }
}
