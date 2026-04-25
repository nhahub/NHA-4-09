import 'package:moodly/core/services/supabase_crud_service.dart';
import 'package:moodly/features/meditations/data/models/article_model.dart';
import '../../../../core/constants/constants.dart';

class RecommendedArticlesRemoteService {
  final SupabaseCRUDService _supabaseCRUDService;

  RecommendedArticlesRemoteService({
    required SupabaseCRUDService supabaseCRUDService,
  }) : _supabaseCRUDService = supabaseCRUDService;

  Future<List<ArticleModel>> getRecommendedArticles({
    required String mood,
  }) async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kArticlesTable,
      ascending: true,
      filters: {'category': mood},
    );

    return data.map((item) => ArticleModel.fromJson(item)).toList();
  }
}
