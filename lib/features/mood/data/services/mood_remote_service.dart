import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/mood_model.dart';

class MoodRemoteService {
  final SupabaseCRUDService _supabaseService;

  MoodRemoteService({required SupabaseCRUDService supabaseService})
    : _supabaseService = supabaseService;

  Future<void> saveCurrentMood({required MoodModel moodModel}) async {
    await _supabaseService.addData(table: kMoodTable, data: moodModel.toJson());
  }
}
