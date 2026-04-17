import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../auth/data/repos/user_data_repo.dart';
import '../../../data/models/question_model.dart';
import '../../../data/models/questionnaire_answers_model.dart';
import '../../../data/repos/questionnaire_repo.dart';
part 'questionnaire_state.dart';

class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  final QuestionnaireRepo _questionnaireRepo;
  final UserDataRepo _userDataRepo;

  QuestionnaireCubit({
    required QuestionnaireRepo questionnaireRepo,
    required UserDataRepo userDataRepo,
  }) : _userDataRepo = userDataRepo,
       _questionnaireRepo = questionnaireRepo,
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
    try {
      await _questionnaireRepo.saveQuestionnaireAnswers(
        questionnaireAnswersModel,
      );
      await _userDataRepo.updateUserFields(isOldUser: true);
      emit(QuestionnaireUploadedState());
    } catch (e) {
      emit(
        QuestionnaireFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
