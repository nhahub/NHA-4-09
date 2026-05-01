import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/video_model.dart';
import '../../../data/repos/recommended_videos_repo.dart';

part 'recommended_videos_state.dart';

class RecommendedVideosCubit extends Cubit<RecommendedVideosState> {
  final RecommendedVideosRepo _recommendedVideosRepo;

  RecommendedVideosCubit({required RecommendedVideosRepo recommendedVideosRepo})
    : _recommendedVideosRepo = recommendedVideosRepo,
      super(RecommendedVideosLoadingState());

  Future<void> getRecommendedVideos({required String currentMood}) async {
    try {
      final List<VideoModel> recommendedVideos = await _recommendedVideosRepo
          .getRecommendedVideos(currentMood: currentMood);
      emit(RecommendedVideosLoadedState(recommendedVideos: recommendedVideos));
    } catch (e) {
      emit(
        RecommendedVideosFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
