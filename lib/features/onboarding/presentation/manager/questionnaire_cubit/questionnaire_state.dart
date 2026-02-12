part of 'questionnaire_cubit.dart';

class QuestionnaireState extends Equatable {
  final Map<String, List<String>> answers;

  const QuestionnaireState({this.answers = const {}});
  QuestionnaireState copyWith({
    int? currentPageIndex,
    Map<String, List<String>>? answers,
  }) {
    return QuestionnaireState(answers: answers ?? this.answers);
  }

  @override
  List<Object> get props => [answers];
}

final class QuestionnaireInitialState extends QuestionnaireState {}

final class QuestionnaireLoadingState extends QuestionnaireState {}

final class QuestionnaireLoadedState extends QuestionnaireState {}

final class QuestionnaireUploadedState extends QuestionnaireState {}

final class QuestionnaireFailureState extends QuestionnaireState {
  final String message;
  const QuestionnaireFailureState({required this.message});
}
