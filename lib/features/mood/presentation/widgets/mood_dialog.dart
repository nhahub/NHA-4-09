import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/functions/build_snack_bar.dart';
import 'package:moodly/core/functions/error_dialog.dart';
import 'package:moodly/core/services/get_it_service.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/core/widgets/app_text_button.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:moodly/features/mood/data/repos/mood_repo.dart';
import 'package:moodly/features/mood/presentation/manager/mood_cubit/mood_cubit.dart';
import '../../../../core/constants/constants.dart';
import 'mood_table.dart';

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
            child: Padding(
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
                  BlocBuilder<MoodCubit, MoodState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          if (state is MoodValidationErrorState)
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: kAppSectionSpacing,
                              ),
                              child: Text(
                                "Please select mood ",
                                style: AppStyles.extraBold14.copyWith(
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          IgnorePointer(
                            ignoring: state is MoodSavingState,
                            child: SizedBox(
                              width: double.infinity,
                              child: AppTextButton(
                                buttonText: "Continue",
                                child: state is MoodSavingState
                                    ? const CustomCircularProgressIndicator()
                                    : null,
                                onPressed: () async {
                                  return await context
                                      .read<MoodCubit>()
                                      .saveCurrentMood(
                                        isDailyMood: isDailyMood,
                                      );
                                },
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
