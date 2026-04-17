import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/audio_model.dart';

class AudioService {
  final SupabaseCRUDService _supabaseCRUDService;

  AudioService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<List<AudioModel>> getASMRTracks() async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kSoundTherapyTracksTable,
      ascending: true,
    );

    return data.map((item) => AudioModel.fromJson(item)).toList();
  }

  Future<List<AudioModel>> getPodcastTracks() async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kPodcastTable,
      ascending: true,
    );

    return data.map((item) => AudioModel.fromJson(item)).toList();
  }
}
