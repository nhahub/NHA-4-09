import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/audio_model.dart';

class AsmrService {
  final SupabaseCRUDService _supabaseCRUDService;

  AsmrService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<List<AudioModel>> getASMRTracks() async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kSoundTherapyTracksTable,
      ascending: true,
    );

    return data.map((item) => AudioModel.fromJson(item)).toList();
  }
}
