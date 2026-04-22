import 'package:flutter/material.dart';

import '../../../../core/services/get_it_service.dart';
import '../../data/services/mood_local_service.dart';
import '../widgets/mood_dialog.dart';

void openDailyMoodDialog(BuildContext context) {
  final MoodLocalService moodLocalService = getIt.get<MoodLocalService>();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!moodLocalService.hasSelectedDailyMood()) {
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
