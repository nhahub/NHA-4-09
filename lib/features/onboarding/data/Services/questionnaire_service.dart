import '../../../../core/services/supabase_crud_service.dart';
import '../models/questionnaire_answers_model.dart';

import '../../../../core/constants/constants.dart';

class QuestionnaireService {
  final SupabaseCRUDService _supabaseService;

  QuestionnaireService({required SupabaseCRUDService supabaseService})
    : _supabaseService = supabaseService;

  Future<void> saveQuestionnaireAnswers(QuestionnaireAnswersModel model) async {
    await _supabaseService.addData(
      table: kQuestionnaireAnswersTable,
      data: model.toJson(),
    );
  }

  Future<bool> isCompleted(String userId) async {
    final res = await _supabaseService.getData(
      table: kQuestionnaireAnswersTable,
      limit: 1,
    );

    if (res.isEmpty) return false;

    return res.any((row) => row['user_id'] == userId);
  }
}
