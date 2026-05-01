import '../../../../core/extensions/string_extensions.dart';
import '../models/video_model.dart';
import '../services/recommended_videos_local_service.dart';
import '../services/recommended_videos_remote_service.dart';

class RecommendedVideosRepo {
  final RecommendedVideosRemoteService _recommendedVideosRemoteService;
  final RecommendedVideosLocalService _recommendedVideosLocalService;

  RecommendedVideosRepo({
    required RecommendedVideosRemoteService recommendedVideosRemoteService,
    required RecommendedVideosLocalService recommendedVideosLocalService,
  }) : _recommendedVideosRemoteService = recommendedVideosRemoteService,
       _recommendedVideosLocalService = recommendedVideosLocalService;

  Future<List<VideoModel>> getRecommendedVideos({
    required String currentMood,
  }) async {
    // Get cached mood
    final String? cachedMood = await _recommendedVideosLocalService
        .getCachedMood();

    // If cached mood is not equal to current mood remove cached data
    if (cachedMood != currentMood) {
      await _recommendedVideosLocalService.clearRecommendedVideos();
      await _recommendedVideosLocalService.saveMood(currentMood);
    }

    // Try to get data from cache first
    final List<VideoModel>? recommendedCachedVideos =
        await _recommendedVideosLocalService.getRecommendedVideos();

    if (recommendedCachedVideos != null && recommendedCachedVideos.isNotEmpty) {
      return recommendedCachedVideos;
    }
    //  No data in cache, fetch from remote
    final List<VideoModel> recommendedVideos =
        await _recommendedVideosRemoteService.getRecommendedVideos(
          mood: currentMood.capitalize(),
        );

    // Save data to cache
    await _recommendedVideosLocalService.cacheRecommendedVideos(
      recommendedVideos: recommendedVideos,
    );

    return recommendedVideos;
  }
}
