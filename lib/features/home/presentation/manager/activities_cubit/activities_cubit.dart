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
      super(const ActivitiesState());

  Future<void> getActivitiesCategories() async {
    try {
      final List<ActivityCategoryModel> activitiesCategories =
          await _activitiesRepo.getActivitiesCategories();

      emit(
        state.copyWith(
          categories: activitiesCategories,
          status: ActivitiesStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: ApiErrorHandler.handle(error: e).message,
          status: ActivitiesStatus.failure,
        ),
      );
    }
  }

  Future<void> getActivities({required String categoryId}) async {
    try {
      emit(state.copyWith(status: ActivitiesStatus.loading));

      final List<ActivityModel> activities = await _activitiesRepo
          .getActivities(categoryId: categoryId);

      emit(
        state.copyWith(
          activities: activities,
          status: ActivitiesStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          error: ApiErrorHandler.handle(error: e).message,
          status: ActivitiesStatus.failure,
        ),
      );
    }
  }
}
