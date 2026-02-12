import 'package:dartz/dartz.dart';
import '../../../../core/helpers/logger.dart';
import '../Services/questionnaire_service.dart';
import '../models/question_model.dart';
import '../models/questionnaire_answers_model.dart';
import '../models/questionnaire_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';

class QuestionnaireRepo {
  final QuestionnaireService _questionnaireService;

  QuestionnaireRepo({required QuestionnaireService questionnaireService})
    : _questionnaireService = questionnaireService;

  List<QuestionModel> getQuestions() {
    return onboardingQuestionnaire.questions;
  }

  Future<Either<Failure, void>> saveQuestionnaireAnswers(
    QuestionnaireAnswersModel model,
  ) async {
    try {
      await _questionnaireService.saveQuestionnaireAnswers(model);
      await updateUserDataRemote();
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> updateUserDataRemote() async {
    try {
      await _questionnaireService.updateUserDataRemote();
      return right(null);
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
