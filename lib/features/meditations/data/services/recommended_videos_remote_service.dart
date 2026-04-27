import '../mock_data/recommended_videos_data.dart';
import '../models/video_model.dart';
import '../../../../core/services/supabase_crud_service.dart';

class RecommendedVideosRemoteService {
  // ignore: unused_field
  final SupabaseCRUDService _supabaseCRUDService;

  RecommendedVideosRemoteService({
    required SupabaseCRUDService supabaseCRUDService,
  }) : _supabaseCRUDService = supabaseCRUDService;

  Future<List<VideoModel>> getRecommendedVideos({required String mood}) async {
    // final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
    //   table: kVideosTable,
    //   ascending: true,
    //   filters: {'category': mood},
    // );

    // return data.map((item) => MediaModel.fromJson(item)).toList();
    return recommendedVideosData;
  }
}
