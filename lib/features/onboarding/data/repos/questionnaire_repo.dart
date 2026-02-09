import 'package:dartz/dartz.dart';
import 'package:moodly/features/onboarding/data/Services/questionnaire_service.dart';
import 'package:moodly/features/onboarding/data/models/questionnaire_answers_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';

class QuestionnaireRepo {
  final QuestionnaireService _questionnaireService;

  QuestionnaireRepo({required QuestionnaireService questionnaireService})
    : _questionnaireService = questionnaireService;

  Future<Either<Failure, void>> saveQuestionnaireAnswers(
    QuestionnaireAnswersModel model,
  ) async {
    try {
      await _questionnaireService.saveQuestionnaireAnswers(model);
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, bool>> isCompleted(String userId) async {
    try {
      final bool isCompleted = await _questionnaireService.isCompleted(userId);
      return right(isCompleted);
    } on Exception catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
