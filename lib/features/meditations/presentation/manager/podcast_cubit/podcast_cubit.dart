import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/repos/audio_repo.dart';

part 'podcast_state.dart';

class PodcastCubit extends Cubit<PodcastState> {
  final AudioRepo _audioRepo;

  PodcastCubit({required AudioRepo audioRepo})
    : _audioRepo = audioRepo,
      super(PodcastLoadingState());

  Future<void> getPodcastTracks() async {
    try {
      final List<AudioModel> podcastTracks = await _audioRepo
          .getPodcastTracks();
      emit(PodcastLoadedState(podcastTracks: podcastTracks));
    } catch (e) {
      emit(
        PodcastFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}
