import 'package:flutter/material.dart';
import '../../../data/models/quote_model.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import 'card_contant.dart';
import 'card_dot.dart';
import 'message_of_the_day_section.dart';

class MainCard extends StatelessWidget {
  final Quote dailyQuote;
  const MainCard({super.key, required this.dailyQuote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MessageOfTheDaySection.cardRadius),
        border: Border.all(color: AppColors.brandGreen, width: 2),
        gradient: const LinearGradient(
          colors: [AppColors.lightGreen, AppColors.brandGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: 0.7,
              child: Image.asset(AppAssets.cardEffect, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [CardDot(), CardDot()],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  child: CardContant(dailyQuote: dailyQuote),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [CardDot(), CardDot()],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
