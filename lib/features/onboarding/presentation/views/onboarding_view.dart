import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/onboarding/presentation/helpers/onboarding_helper.dart';
import '../../data/models/questionnaire_model.dart';
import '../manager/onboarding_cubit/onboarding_cubit.dart';
import '../manager/onboarding_cubit/onboarding_state.dart';
import '../widgets/onboarding_appbar.dart';
import '../widgets/onboarding_page_view.dart';
import '../widgets/questionnaire_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final questions = onboardingQuestionnaire.questions;

    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            body: Column(
              children: [
                SizedBox(height: state.currentPageIndex == 0 ? 80 : 60),

                OnboardingAppbar(
                  currentPageIndex: state.currentPageIndex,
                  questionsLength: questions.length,
                  previousPage: cubit.previousPage,
                ),

                OnboardingPageView(
                  onPageChanged: (index) {
                    cubit.goToPage(index);
                  },
                  questions: questions,
                  nextPage: cubit.nextPage,
                  onSelectOption: cubit.selectOption,
                ),

                if (state.currentPageIndex != 0) ...[
                  QuestionnaireButton(
                    currentPageIndex: state.currentPageIndex,
                    onNext: cubit.nextPage,
                    onFinish: () => onFinishOnboarding(context),
                    questionsLength: questions.length,
                    selectedValues: state.currentPageIndex > 0
                        ? state.answers[questions[state.currentPageIndex - 1]
                                  .id] ??
                              []
                        : [],
                  ),
                  const SizedBox(height: 32),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
