import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import 'message_of_the_day_section.dart';

class RotatedGradientCard extends StatelessWidget {
  const RotatedGradientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: MessageOfTheDaySection.rotationAngle,
      child: Transform.translate(
        offset: MessageOfTheDaySection.translateOffset,
        child: Container(
          height: MessageOfTheDaySection.cardHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              MessageOfTheDaySection.cardRadius,
            ),
            gradient: const LinearGradient(
              colors: [AppColors.lightGreen, AppColors.brandGreen],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, 0.75],
            ),
          ),
        ),
      ),
    );
  }
}
