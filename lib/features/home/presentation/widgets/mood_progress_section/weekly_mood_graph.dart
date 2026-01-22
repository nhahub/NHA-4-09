import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/core/widgets/custom_circle_button.dart';

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
            Text("April 21-27", style: AppStyles.extraBold15),
            const Spacer(),
            CustomCircleButton(icon: AppAssets.arrowRightIosIcon, onTap: () {}),
          ],
        ),
        Text("WeeklyMoodGraph"),
      ],
    );
  }
}
