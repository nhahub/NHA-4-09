import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/dummy/dummy_activities_categories.dart';
import '../../manager/activities_cubit/activities_cubit.dart';
import 'activities_categories_list_view.dart';

class ActivityCategoriesBlocBuilder extends StatelessWidget {
  const ActivityCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        switch (state.status) {
          case ActivitiesStatus.loading:
            return ActivitiesCategoriesListView(
              activityCategories:
                  DummyActivitiesCategories.dummyActivitiesCategories,
              isLoading: true,
            );
          case ActivitiesStatus.success:
            return ActivitiesCategoriesListView(
              activityCategories: state.categories!,
            );
          case ActivitiesStatus.failure:
            return CustomErrorWidget(message: state.error!);
        }
      },
    );
  }
}
