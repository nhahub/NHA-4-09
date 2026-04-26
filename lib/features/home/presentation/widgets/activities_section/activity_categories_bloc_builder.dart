import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/presentation/widgets/activities_section/activities_categories_list_view.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/dummy/dummy_activities_categories.dart';
import '../../../data/models/activity/activity_category_model.dart';
import '../../manager/activities_cubit/activities_cubit.dart';

class ActivityCategoriesBlocBuilder extends StatelessWidget {
  const ActivityCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        switch (state) {
          case ActivitiesLoadingState():
            return ActivitiesCategoriesListView(
              activityCategories:
                  DummyActivitiesCategories.dummyActivitiesCategories,
              isLoading: true,
            );
          case ActivitiesCategoriesLoadedState(
            categories: final List<ActivityCategoryModel> activityCategories,
          ):
            return ActivitiesCategoriesListView(
              activityCategories: activityCategories,
            );
          case ActivitiesFailureState(message: final String message):
            return CustomErrorWidget(message: message);

          case ActivitiesLoadedState():
            return const SizedBox.shrink();
        }
      },
    );
  }
}
