import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../manager/questionnaire_cubit/questionnaire_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../data/models/question_model.dart';
import '../manager/onboarding_cubit/onboarding_cubit.dart';
import '../manager/onboarding_cubit/onboarding_state.dart';
import '../widgets/onboarding_appbar.dart';
import '../widgets/onboarding_page_view.dart';
import '../widgets/questionnaire_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingCubit onboardingCubit = context.read<OnboardingCubit>();
    final QuestionnaireCubit questionnaireCubit = context
        .read<QuestionnaireCubit>();
    final List<QuestionModel> questions = questionnaireCubit.getQuestions();

    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state.isFinished) {
          context.pushAndRemoveUntil(Routes.premiumView, args: false);
        }
      },
      builder: (context, state) {
        final int currentPageIndex = state.currentPageIndex;
        final bool isFirstPage = currentPageIndex == 0;
        final int questionsLength = questions.length;

        return Scaffold(
          body: Column(
            children: [
              SizedBox(height: isFirstPage ? 80 : 60),

              OnboardingAppbar(
                currentPageIndex: currentPageIndex,
                questionsLength: questionsLength,
                previousPage: onboardingCubit.previousPage,
              ),

              OnboardingPageView(
                questions: questions,
                onPageChanged: onboardingCubit.goToPage,
                nextPage: onboardingCubit.nextPage,
                pageController: onboardingCubit.pageController,
              ),

              if (!isFirstPage) ...[
                BlocSelector<
                  QuestionnaireCubit,
                  QuestionnaireState,
                  List<String>
                >(
                  selector: (state) {
                    if (currentPageIndex == 0) return [];
                    final id = questions[currentPageIndex - 1].id;
                    return state.answers[id] ?? [];
                  },
                  builder: (context, selectedValues) {
                    return QuestionnaireButton(
                      questions: questions,
                      currentPageIndex: currentPageIndex,
                      onNext: onboardingCubit.nextPage,
                      questionsLength: questionsLength,
                      selectedValues: selectedValues,
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ],
          ),
        );
      },
    );
  }
}
