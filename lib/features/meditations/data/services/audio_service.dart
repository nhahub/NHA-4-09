import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/audio_model.dart';

class AudioService {
  final SupabaseCRUDService supabaseCRUDService;

  AudioService({required this.supabaseCRUDService});

  Future<List<AudioModel>> getAudioTracks() async {
    final List<Map<String, dynamic>> data = await supabaseCRUDService.getData(
      table: kSoundTherapyTracksTable,
      ascending: true,
    );

    return data.map((item) => AudioModel.fromJson(item)).toList();
  }
}
