import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/audio_model.dart';

class PodcastService {
  final SupabaseCRUDService _supabaseCRUDService;

  PodcastService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<List<AudioModel>> getPodcastTracks() async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kPodcastTable,
      ascending: true,
    );

    return data.map((item) => AudioModel.fromJson(item)).toList();
  }
}
