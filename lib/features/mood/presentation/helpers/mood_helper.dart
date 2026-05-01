import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../data/repos/mood_repo.dart';
import '../manager/mood_cubit/mood_cubit.dart';
import '../widgets/mood_dialog.dart';

void openDailyMoodDialog(BuildContext context) async {
  final MoodRepo moodRepo = getIt.get<MoodRepo>();
  final bool hasSelectedDailyMood = await moodRepo.hasSelectedDailyMood();
  final String? currentMood = await moodRepo.getSavedMood();

  if (!context.mounted) return;

  if (!hasSelectedDailyMood) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<MoodCubit>(),
          child: const MoodDialog(isDailyMood: true),
        );
      },
    );
  } else {
    context.read<MoodCubit>().emitMoodFromCache(currentMood: currentMood!);
  }
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
