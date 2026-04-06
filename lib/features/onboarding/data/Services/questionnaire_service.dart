import '../../../../core/constants/constants.dart';
import '../../../auth/data/services/supabase_auth_service.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/questionnaire_answers_model.dart';

class QuestionnaireService {
  final SupabaseCRUDService _supabaseService;

  QuestionnaireService({
    required SupabaseCRUDService supabaseService,
    required SupabaseAuthService supabaseAuthService,
  }) : _supabaseService = supabaseService;

  Future<void> saveQuestionnaireAnswers(QuestionnaireAnswersModel model) async {
    await _supabaseService.addData(
      table: kQuestionnaireAnswersTable,
      data: model.toJson(),
    );
  }
}
