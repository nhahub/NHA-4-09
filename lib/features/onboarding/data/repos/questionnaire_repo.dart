import '../../../../core/functions/user_data_local.dart';
import '../Services/questionnaire_local_service.dart';
import '../Services/questionnaire_remote_service.dart';
import '../models/question_model.dart';
import '../models/questionnaire_answers_model.dart';
import '../models/questionnaire_model.dart';

class QuestionnaireRepo {
  final QuestionnaireRemoteService _questionnaireService;
  final QuestionnaireLocalService _questionnaireLocalService;

  QuestionnaireRepo({
    required QuestionnaireRemoteService questionnaireService,
    required QuestionnaireLocalService questionnaireLocalService,
  }) : _questionnaireService = questionnaireService,
       _questionnaireLocalService = questionnaireLocalService;

  List<QuestionModel> getQuestions() {
    return onboardingQuestionnaire.questions;
  }

  Future<void> saveQuestionnaireAnswers(QuestionnaireAnswersModel model) async {
    await _questionnaireService.saveQuestionnaireAnswers(model);
  }

  Future<QuestionnaireAnswersModel> getQuestionnaireAnswers() async {
    // Try to get data from cache first
    final QuestionnaireAnswersModel? questionnaireAnswers =
        await _questionnaireLocalService.getQuestionnaireAnswers();

    if (questionnaireAnswers != null) {
      return questionnaireAnswers;
    }
    //  No data in cache, fetch from remote
    final QuestionnaireAnswersModel? questionnaireAnswersRemote =
        await _questionnaireService.getQuestionnaireAnswers(
          userId: getUser()!.userId,
        );

    // Save data to cache
    await _questionnaireLocalService.cacheQuestionnaireAnswers(
      questionnaireAnswers: questionnaireAnswersRemote!,
    );

    return questionnaireAnswersRemote;
  }
}
