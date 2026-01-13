import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/questionnaire_model.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(const OnboardingState());

  void nextPage() async {
    final maxIndex = onboardingQuestionnaire.questions.length;
    final nextIndex = state.currentPageIndex + 1;

    if (nextIndex <= maxIndex) {
      await pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPageIndex: nextIndex));
    }
  }

  void previousPage() async {
    final prevIndex = state.currentPageIndex - 1;

    if (prevIndex >= 0) {
      await pageController.animateToPage(
        prevIndex,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
      );
      emit(state.copyWith(currentPageIndex: prevIndex));
    }
  }

  void goToPage(int index) {
    pageController.jumpToPage(index);
    emit(state.copyWith(currentPageIndex: index));
  }

  void selectOption(String questionId, String optionId) {
    final newAnswers = Map<String, List<String>>.from(state.answers);
    newAnswers.putIfAbsent(questionId, () => []);
    if (newAnswers[questionId]!.contains(optionId)) {
      newAnswers[questionId]!.remove(optionId);
    } else {
      newAnswers[questionId]!.add(optionId);
    }
    emit(state.copyWith(answers: newAnswers));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
