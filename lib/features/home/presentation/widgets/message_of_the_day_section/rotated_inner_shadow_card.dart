import 'package:flutter/material.dart';
import '../../../data/models/quote_model.dart';
import 'card_contant.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import 'message_of_the_day_section.dart';

class RotatedInnerShadowCard extends StatelessWidget {
  final Quote dailyQuote;
  const RotatedInnerShadowCard({super.key, required this.dailyQuote});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: MessageOfTheDaySection.rotationAngle,
      child: Transform.translate(
        offset: MessageOfTheDaySection.translateOffset,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              MessageOfTheDaySection.cardRadius,
            ),
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(12)),
          ),
          child: Opacity(
            opacity: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
              child: CardContant(dailyQuote: dailyQuote),
            ),
          ),
        ),
      ),
    );
  }
}
