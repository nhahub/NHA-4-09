import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/services/supabase_crud_service.dart';
import 'package:moodly/features/mood/data/models/mood_model.dart';

class MoodRemoteService {
  final SupabaseCRUDService _supabaseService;

  MoodRemoteService({required SupabaseCRUDService supabaseService})
    : _supabaseService = supabaseService;

  Future<void> saveCurrentMood({required MoodModel moodModel}) async {
    await _supabaseService.addData(table: kMoodTable, data: moodModel.toJson());
  }
}
