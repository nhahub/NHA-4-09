import 'package:flutter/material.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_circle_button.dart';
import '../../../data/mock_data/week_mood.dart';
import 'custom_mood_progress_graph.dart';

class WeeklyMoodGraph extends StatelessWidget {
  const WeeklyMoodGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCircleButton(icon: AppAssets.arrowLeftIosIcon, onTap: () {}),
            const Text("April 21-27", style: AppStyles.extraBold15),
            CustomCircleButton(icon: AppAssets.arrowRightIosIcon, onTap: () {}),
          ],
        ),
        CustomMoodProgressGraph(moodData: weekMood, barWidth: 33.39),
      ],
    );
  }
}
