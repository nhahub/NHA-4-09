import 'package:moodly/features/onboarding/data/models/questionnaire_answers_model.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/local_cache_service.dart';

class QuestionnaireLocalService {
  final LocalCacheService<QuestionnaireAnswersModel> _localCacheService;

  QuestionnaireLocalService({
    required LocalCacheService<QuestionnaireAnswersModel> localCacheService,
  }) : _localCacheService = localCacheService;

  Future<QuestionnaireAnswersModel?> getQuestionnaireAnswers() async {
    final QuestionnaireAnswersModel? model = await _localCacheService.get(
      key: kQuestionnaireAnswers,
      boxName: kQuestionnaireAnswersBox,
    );
    return model;
  }

  Future<void> cacheQuestionnaireAnswers({
    required QuestionnaireAnswersModel questionnaireAnswers,
  }) async {
    await _localCacheService.save(
      key: kQuestionnaireAnswers,
      boxName: kQuestionnaireAnswersBox,
      value: questionnaireAnswers,
    );
  }

  Future<void> clearQuestionnaireAnswers() async {
    await _localCacheService.clear(
      key: kQuestionnaireAnswers,
      boxName: kQuestionnaireAnswersBox,
    );
  }
}
