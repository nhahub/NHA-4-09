import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPageIndex;
  final Map<String, List<String>> answers;

  const OnboardingState({this.currentPageIndex = 0, this.answers = const {}});

  OnboardingState copyWith({
    int? currentPageIndex,
    Map<String, List<String>>? answers,
  }) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      answers: answers ?? this.answers,
    );
  }

  @override
  List<Object?> get props => [currentPageIndex, answers];
}
