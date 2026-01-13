import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/question_model.dart';
import '../manager/onboarding_cubit/onboarding_cubit.dart';
import '../manager/onboarding_cubit/onboarding_state.dart';
import '../views/welcome_view.dart';
import 'question_widget.dart';

class OnboardingPageView extends StatefulWidget {
  final void Function(int)? onPageChanged;
  final List<QuestionModel> questions;
  final void Function() nextPage;
  final void Function(String questionId, String optionId) onSelectOption;

  const OnboardingPageView({
    super.key,
    required this.onPageChanged,
    required this.questions,
    required this.nextPage,
    required this.onSelectOption,
  });

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return Expanded(
      child: PageView.builder(
        controller: cubit.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: widget.onPageChanged,
        itemCount: widget.questions.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) return WelcomeView(onNext: widget.nextPage);

          final question = widget.questions[index - 1];

          return BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final selectedValues = state.answers[question.id] ?? [];
              return QuestionWidget(
                key: ValueKey(question.id),
                question: question.question,
                options: question.options,
                selectedValues: selectedValues,
                onSelect: (optionId) {
                  widget.onSelectOption(question.id, optionId);
                  setState(() {});
                },
              );
            },
          );
        },
      ),
    );
  }
}
