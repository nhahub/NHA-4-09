import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/activity/activity_category_model.dart';
import '../models/activity/activity_model.dart';

class ActivitiesRemoteService {
  final SupabaseCRUDService _supabaseCRUDService;

  ActivitiesRemoteService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<List<ActivityModel>> getActivities({
    required String categoryId,
  }) async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kActivitiesTable,
      filters: {'category_id': categoryId},
    );
    return data.map((item) => ActivityModel.fromJson(item)).toList();
  }

  Future<List<ActivityCategoryModel>> getActivitiesCategories() async {
    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kActivityCategoriesTable,
    );
    return data.map((item) => ActivityCategoryModel.fromJson(item)).toList();
  }
}
