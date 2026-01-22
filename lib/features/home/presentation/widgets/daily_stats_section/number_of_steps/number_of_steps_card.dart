import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/number_of_steps/number_of_steps_tracker.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/number_of_steps/steps_header.dart';

class NumberOfStepsCard extends StatelessWidget {
  const NumberOfStepsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kAppSectionSpacing),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        children: [StepsHeader(), SizedBox(height: 10), NumberOfStepsTracker()],
      ),
    );
  }
}
