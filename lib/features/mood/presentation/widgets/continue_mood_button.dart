import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../manager/mood_cubit/mood_cubit.dart';

class ContinueMoodButton extends StatelessWidget {
  final bool isDailyMood;
  const ContinueMoodButton({super.key, required this.isDailyMood});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodCubit, MoodState>(
      builder: (context, state) {
        return Column(
          children: [
            if (state is MoodValidationErrorState)
              Padding(
                padding: const EdgeInsets.only(bottom: kAppSectionSpacing),
                child: Text(
                  "Please select mood",
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
                  onPressed: () => context.read<MoodCubit>().saveCurrentMood(
                    isDailyMood: isDailyMood,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
