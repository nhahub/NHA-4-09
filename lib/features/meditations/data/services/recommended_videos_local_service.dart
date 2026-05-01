import '../models/video_model.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/services/local_cache_service.dart';

class RecommendedVideosLocalService {
  final LocalCacheService<VideoModel> _localCacheService;

  RecommendedVideosLocalService({
    required LocalCacheService<VideoModel> localCacheService,
  }) : _localCacheService = localCacheService;

  Future<List<VideoModel>?> getRecommendedVideos() async {
    final List<VideoModel>? list = await _localCacheService.getList(
      key: kRecommendedVideos,
      boxName: kRecommendedVideosBox,
    );
    return list;
  }

  Future<void> cacheRecommendedVideos({
    required List<VideoModel> recommendedVideos,
  }) async {
    await _localCacheService.saveList(
      key: kRecommendedVideos,
      boxName: kRecommendedVideosBox,
      list: recommendedVideos,
    );
  }

  Future<void> clearRecommendedVideos() async {
    await _localCacheService.clear(
      key: kRecommendedVideos,
      boxName: kRecommendedVideosBox,
    );
  }

  Future<void> saveMood(String mood) async {
    await _localCacheService.save(
      key: kCachedMood,
      boxName: kRecommendedVideosBox,
      value: mood,
    );
  }

  Future<String?> getCachedMood() async {
    return await _localCacheService.get(
      key: kCachedMood,
      boxName: kRecommendedVideosBox,
    );
  }
}
