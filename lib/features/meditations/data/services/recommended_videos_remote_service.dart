import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/video_model.dart';

class RecommendedVideosRemoteService {
  final SupabaseCRUDService _supabaseCRUDService;

  RecommendedVideosRemoteService({
    required SupabaseCRUDService supabaseCRUDService,
  }) : _supabaseCRUDService = supabaseCRUDService;

  Future<List<VideoModel>> getRecommendedVideos({required String mood}) async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kVideosTable,
      ascending: true,
      filters: {'category': mood},
    );

    return data.map((item) => VideoModel.fromJson(item)).toList();
  }
}
