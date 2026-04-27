import '../models/audio_model.dart';
import '../services/asmr_service.dart';

class AsmrRepo {
  final AsmrService _asmrService;
  AsmrRepo({required AsmrService asmrService}) : _asmrService = asmrService;

  Future<List<AudioModel>> getASMRTracks() async {
    final List<AudioModel> asmrTracks = await _asmrService.getASMRTracks();
    return asmrTracks;
  }
}
