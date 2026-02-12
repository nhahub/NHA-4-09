import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/questionnaire_cubit/questionnaire_cubit.dart';

import '../../data/models/question_model.dart';
import '../views/welcome_view.dart';
import 'question_widget.dart';

class OnboardingPageView extends StatelessWidget {
  final void Function(int)? onPageChanged;
  final List<QuestionModel> questions;
  final void Function() nextPage;
  final PageController pageController;

  const OnboardingPageView({
    super.key,
    required this.onPageChanged,
    required this.questions,
    required this.nextPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        itemCount: questions.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return WelcomeView(onNext: nextPage);

          final question = questions[index - 1];

          return BlocSelector<
            QuestionnaireCubit,
            QuestionnaireState,
            List<String>
          >(
            selector: (state) => state.answers[question.id] ?? [],
            builder: (context, selectedValues) {
              final QuestionnaireCubit questionnaireCubit = context
                  .read<QuestionnaireCubit>();
              return QuestionWidget(
                key: ValueKey(question.id),
                question: question.question,
                options: question.options,
                selectedValues: selectedValues,
                onSelect: (optionId) {
                  questionnaireCubit.selectOption(
                    questionId: question.id,
                    optionId: optionId,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
