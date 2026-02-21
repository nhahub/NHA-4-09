import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/build_snack_bar.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/services/get_it_service.dart';
import '../../data/repos/mood_repo.dart';
import '../manager/mood_cubit/mood_cubit.dart';
import 'mood_dialog_content.dart';

class MoodDialog extends StatelessWidget {
  final bool isDailyMood;
  const MoodDialog({super.key, required this.isDailyMood});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoodCubit(moodRepo: getIt.get<MoodRepo>()),
      child: BlocListener<MoodCubit, MoodState>(
        listener: (context, state) {
          if (state is MoodSavedState) {
            context.pop();
            successSnackBar(
              context: context,
              message: "Mood saved successfully",
            );
          } else if (state is MoodFailedState) {
            context.read<MoodCubit>().resetSelectedIndex();
            errorDialog(context: context, message: state.message);
          }
        },
        child: PopScope(
          canPop: false,
          child: Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            insetPadding: const EdgeInsets.symmetric(
              horizontal: kAppHorizontalPadding,
            ),
            child: MoodDialogContent(isDailyMood: isDailyMood),
          ),
        ),
      ),
    );
  }
}
