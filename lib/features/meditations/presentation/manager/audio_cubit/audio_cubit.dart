import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/repos/audio_repo.dart';
part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  final AudioRepo _audioRepo;

  AudioCubit({required AudioRepo audioRepo})
    : _audioRepo = audioRepo,
      super(AudioLoadingState());

  Future<void> getASMRTracks() async {
    try {
      final List<AudioModel> asmrTracks = await _audioRepo.getASMRTracks();
      emit(AudioLoadedSuccessState(tracks: asmrTracks));
    } catch (e) {
      emit(
        AudioFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }

  Future<void> getPodcastTracks() async {
    try {
      final List<AudioModel> podcastTracks = await _audioRepo
          .getPodcastTracks();
      emit(AudioLoadedSuccessState(tracks: podcastTracks));
    } catch (e) {
      emit(
        AudioFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}
