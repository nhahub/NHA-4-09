import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_auth_service.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/questionnaire_answers_model.dart';

class QuestionnaireService {
  final SupabaseCRUDService _supabaseService;
  final SupabaseAuthService _supabaseAuthService;

  QuestionnaireService({
    required SupabaseCRUDService supabaseService,
    required SupabaseAuthService supabaseAuthService,
  }) : _supabaseService = supabaseService,
       _supabaseAuthService = supabaseAuthService;

  Future<void> saveQuestionnaireAnswers(QuestionnaireAnswersModel model) async {
    await _supabaseService.addData(
      table: kQuestionnaireAnswersTable,
      data: model.toJson(),
    );
  }

  Future<void> updateUserStatus() async {
    await _supabaseAuthService.editUserProfile(data: {"is_old_user": true});
  }
}
