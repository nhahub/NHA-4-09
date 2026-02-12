import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int currentPageIndex;
  final bool isFinished;

  const OnboardingState({this.currentPageIndex = 0, this.isFinished = false});

  OnboardingState copyWith({
    int? currentPageIndex,
    bool? hasSeenOnboarding,
    bool? isFinished,
    Map<String, List<String>>? answers,
  }) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      isFinished: isFinished ?? this.isFinished,
    );
  }

  @override
  List<Object?> get props => [currentPageIndex, isFinished];
}
