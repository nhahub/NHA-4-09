import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/functions/error_dialog.dart';
import 'package:moodly/features/onboarding/data/models/question_model.dart';
import '../../../../core/functions/get_user.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../data/models/questionnaire_answers_model.dart';
import '../manager/onboarding_cubit/onboarding_cubit.dart';
import '../manager/questionnaire_cubit/questionnaire_cubit.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class QuestionnaireButton extends StatelessWidget {
  const QuestionnaireButton({
    super.key,
    required this.currentPageIndex,
    required this.onNext,
    required this.questionsLength,
    required this.selectedValues,
    required this.questions,
  });

  final VoidCallback onNext;
  final int currentPageIndex;
  final int questionsLength;
  final List<String> selectedValues;
  final List<QuestionModel> questions;

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    final questionnaireCubit = context.read<QuestionnaireCubit>();
    return BlocConsumer<QuestionnaireCubit, QuestionnaireState>(
      listener: (context, state) {
        if (state is QuestionnaireFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state is QuestionnaireLoadingState,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: AppTextButton(
                onPressed: () async {
                  if (currentPageIndex == questionsLength) {
                    await questionnaireCubit.saveQuestionnaireAnswers(
                      questionnaireAnswersModel: QuestionnaireAnswersModel(
                        userId: getUser()!.userId,
                        q1: state.answers[questions[0].id]!,
                        q2: state.answers[questions[1].id]!,
                        q3: state.answers[questions[2].id]!,
                      ),
                    );
                    await onboardingCubit.finishOnboarding();
                  } else if (selectedValues.isEmpty) {
                    null;
                  } else {
                    onNext();
                  }
                },
                active:
                    state
                        .answers[questions[currentPageIndex - 1].id]
                        ?.isNotEmpty ==
                    true,
                child: currentPageIndex == questionsLength
                    ? Center(
                        child: state is QuestionnaireLoadingState
                            ? const CustomCircularProgressIndicator()
                            : Text(
                                "Finish",
                                style: AppStyles.extraBold16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Continue",
                            style: AppStyles.extraBold16.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset(
                            AppAssets.arrowRightIcon,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
