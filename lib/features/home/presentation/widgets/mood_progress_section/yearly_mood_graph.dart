import 'package:flutter/material.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_circle_button.dart';
import 'custom_mood_progress_graph.dart';

class YearlyMoodGraph extends StatelessWidget {
  const YearlyMoodGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomCircleButton(icon: AppAssets.arrowLeftIosIcon, onTap: () {}),
            const Spacer(),
            const Text("2026", style: AppStyles.extraBold15),
            const Spacer(),
            CustomCircleButton(icon: AppAssets.arrowRightIosIcon, onTap: () {}),
          ],
        ),
        const SizedBox(height: 16),
        const CustomMoodProgressGraph(),
      ],
    );
  }
}
