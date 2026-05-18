import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/questionnaire_answers_model.dart';

class QuestionnaireRemoteService {
  final SupabaseCRUDService _supabaseService;

  QuestionnaireRemoteService({required SupabaseCRUDService supabaseService})
    : _supabaseService = supabaseService;

  Future<void> saveQuestionnaireAnswers(QuestionnaireAnswersModel model) async {
    await _supabaseService.addData(
      table: kQuestionnaireAnswersTable,
      data: model.toJson(),
    );
  }

  Future<QuestionnaireAnswersModel?> getQuestionnaireAnswers({
    required String userId,
  }) async {
    final data = await _supabaseService.getSingleRow(
      table: kQuestionnaireAnswersTable,
      filters: {'user_id': userId},
    );

    if (data == null) return null;

    return QuestionnaireAnswersModel.fromJson(data);
  }
}
