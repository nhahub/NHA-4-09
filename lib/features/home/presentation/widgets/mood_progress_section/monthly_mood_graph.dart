import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/core/widgets/custom_circle_button.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/custom_mood_progress_graph.dart';

class MonthlyMoodGraph extends StatelessWidget {
  const MonthlyMoodGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomCircleButton(icon: AppAssets.arrowRightIosIcon, onTap: () {}),
            const Spacer(),
            Text("April", style: AppStyles.extraBold15),
            const Spacer(),
            CustomCircleButton(icon: AppAssets.arrowLeftIosIcon, onTap: () {}),
          ],
        ),
        SizedBox(height: 16),
        CustomMoodProgressGraph(),
      ],
    );
  }
}
