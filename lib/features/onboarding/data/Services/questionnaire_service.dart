import 'package:moodly/core/functions/get_user.dart';

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

  Future<void> updateUserDataRemote() async {
    await _supabaseService.updateData(
      table: kProfilesTable,
      data: {"is_old_user": true},
      idColumn: "is_old_user",
      idValue: getUser()!.userId,
    );
  }
}
