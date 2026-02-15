import 'package:flutter/material.dart';
import 'package:moodly/features/mood/data/services/mood_local_service.dart';
import 'package:moodly/features/mood/presentation/widgets/mood_dialog.dart';

void openDailyMoodDialog(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!MoodLocalService.hasSelectedDailyMood()) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const MoodDialog(isDailyMood: true);
        },
      );
    }
  });
}

void openAfterSessionMoodDialog(BuildContext context) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const MoodDialog(isDailyMood: false);
      },
    );
  });
}
