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
      children: [
        Row(
          children: [
            CustomCircleButton(icon: AppAssets.arrowLeftIosIcon, onTap: () {}),
            const Spacer(),
            const Text("April 21-27", style: AppStyles.extraBold15),
            const Spacer(),
            CustomCircleButton(icon: AppAssets.arrowRightIosIcon, onTap: () {}),
          ],
        ),
        const SizedBox(height: 16),
        CustomMoodProgressGraph(moodData: weekMood, barWidth: 33.39),
      ],
    );
  }
}
