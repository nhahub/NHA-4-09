import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/activity/activity_category_model.dart';
import '../../../data/models/activity/activity_model.dart';
import '../../../data/repos/activities_repo.dart';

part 'activities_state.dart';

class ActivitiesCubit extends Cubit<ActivitiesState> {
  final ActivitiesRepo _activitiesRepo;
  ActivitiesCubit({required ActivitiesRepo activitiesRepo})
    : _activitiesRepo = activitiesRepo,
      super(ActivitiesLoadingState());

  Future<void> getActivitiesCategories() async {
    try {
      final List<ActivityCategoryModel> activitiesCategories =
          await _activitiesRepo.getActivitiesCategories();

      emit(ActivitiesCategoriesLoadedState(categories: activitiesCategories));
    } catch (e) {
      emit(
        ActivitiesFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> getActivities({required String categoryId}) async {
    try {
      final List<ActivityModel> activities = await _activitiesRepo
          .getActivities(categoryId: categoryId);

      emit(ActivitiesLoadedState(activities: activities));
    } catch (e) {
      emit(
        ActivitiesFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
