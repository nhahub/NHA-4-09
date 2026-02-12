import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/question_model.dart';
import '../../../data/repos/questionnaire_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/questionnaire_answers_model.dart';

part 'questionnaire_state.dart';

class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  final QuestionnaireRepo _questionnaireRepo;

  QuestionnaireCubit({required QuestionnaireRepo questionnaireRepo})
    : _questionnaireRepo = questionnaireRepo,
      super(QuestionnaireInitialState());

  List<QuestionModel> getQuestions() {
    final List<QuestionModel> result = _questionnaireRepo.getQuestions();
    return result;
  }

  void selectOption({required String questionId, required String optionId}) {
    final newAnswers = Map<String, List<String>>.from(state.answers);

    final currentList = List<String>.from(newAnswers[questionId] ?? []);

    if (currentList.contains(optionId)) {
      currentList.remove(optionId);
    } else {
      currentList.add(optionId);
    }

    newAnswers[questionId] = currentList;

    emit(state.copyWith(answers: newAnswers));
  }

  Future<void> saveQuestionnaireAnswers({
    required QuestionnaireAnswersModel questionnaireAnswersModel,
  }) async {
    emit(QuestionnaireLoadingState());
    final Either<Failure, void> result = await _questionnaireRepo
        .saveQuestionnaireAnswers(questionnaireAnswersModel);

    result.fold(
      (failure) => emit(QuestionnaireFailureState(message: failure.message)),
      (_) => emit(QuestionnaireUploadedState()),
    );
  }
}
