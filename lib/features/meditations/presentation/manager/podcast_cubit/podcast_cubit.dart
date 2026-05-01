import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/audio_model.dart';
import '../../../data/repos/podcast_repo.dart';

part 'podcast_state.dart';

class PodcastCubit extends Cubit<PodcastState> {
  final PodcastRepo _podcastRepo;

  PodcastCubit({required PodcastRepo podcastRepo})
    : _podcastRepo = podcastRepo,
      super(PodcastLoadingState());

  Future<void> getPodcastTracks() async {
    try {
      final List<AudioModel> podcastTracks = await _podcastRepo
          .getPodcastTracks();
      emit(PodcastLoadedState(podcastTracks: podcastTracks));
    } catch (e) {
      emit(
        PodcastFailureState(message: ApiErrorHandler.handle(error: e).message),
      );
    }
  }
}
