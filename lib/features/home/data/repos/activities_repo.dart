import '../models/activity/activity_category_model.dart';
import '../models/activity/activity_model.dart';
import '../services/activities_remote_service.dart';

class ActivitiesRepo {
  final ActivitiesRemoteService _activitiesRemoteService;

  ActivitiesRepo({required ActivitiesRemoteService activitiesRemoteService})
    : _activitiesRemoteService = activitiesRemoteService;

  Future<List<ActivityCategoryModel>> getActivitiesCategories() async {
    return await _activitiesRemoteService.getActivitiesCategories();
  }

  Future<List<ActivityModel>> getActivities({
    required String categoryId,
  }) async {
    return await _activitiesRemoteService.getActivities(categoryId: categoryId);
  }
}
