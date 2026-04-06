import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/core/models/user_data_model.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/question_model.dart';
import '../../../data/models/questionnaire_answers_model.dart';
import '../../../data/repos/questionnaire_repo.dart';

part 'questionnaire_state.dart';

class QuestionnaireCubit extends Cubit<QuestionnaireState> {
  final QuestionnaireRepo _questionnaireRepo;
  final UserDataRepo userDataRepo;

  QuestionnaireCubit({
    required QuestionnaireRepo questionnaireRepo,
    required this.userDataRepo,
  }) : _questionnaireRepo = questionnaireRepo,
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
      (_) async {
        await userDataRepo.updateUserData(
          userDataModel: UserDataModel(
            name: getUser()!.name,
            email: getUser()!.email,
            picture: getUser()!.picture,
            phone: getUser()!.phone,
            createdAt: getUser()!.createdAt,
            userId: getUser()!.userId,
            isOldUser: true,
          ),
        );
        return emit(QuestionnaireUploadedState());
      },
    );
  }
}
