import 'package:flutter/material.dart';
import 'package:moodly/core/constants/static.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/number_of_steps/number_of_steps_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_amount/water_amount_card.dart';

class DailyStatsContainer extends StatelessWidget {
  const DailyStatsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.bgFill,
        border: Border.all(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [WaterAmountCard(), SizedBox(height: 4), NumberOfStepsCard()],
      ),
    );
  }
}
