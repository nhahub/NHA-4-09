import 'package:dartz/dartz.dart';
import '../models/audio_model.dart';
import '../services/audio_service.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';

class AudioRepo {
  final AudioService audioService;
  AudioRepo({required this.audioService});

  Future<Either<Failure, List<AudioModel>>> getAudioTracks() async {
    try {
      final List<AudioModel> tracks = await audioService.getAudioTracks();
      return right(tracks);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
