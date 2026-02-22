import 'package:flutter/material.dart';

import '../../data/services/mood_local_service.dart';
import '../widgets/mood_dialog.dart';

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
