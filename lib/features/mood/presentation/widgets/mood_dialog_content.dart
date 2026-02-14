import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_styles.dart';
import 'continue_mood_button.dart';
import 'mood_table.dart';

class MoodDialogContent extends StatelessWidget {
  final bool isDailyMood;
  const MoodDialogContent({super.key, required this.isDailyMood});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kAppHorizontalPadding),
      child: Column(
        spacing: kAppSectionSpacing,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "How are you feeling ${isDailyMood ? 'today' : 'now'}?",
            style: AppStyles.extraBold20,
          ),
          const MoodTable(),
          ContinueMoodButton(isDailyMood: isDailyMood),
        ],
      ),
    );
  }
}
