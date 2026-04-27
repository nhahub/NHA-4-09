import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/dummy/dummy_activities.dart';
import '../../../data/models/activity/activity_model.dart';
import '../../manager/activities_cubit/activities_cubit.dart';
import 'activities_page_view.dart';

class ActivitiesBlocBuilder extends StatelessWidget {
  const ActivitiesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        switch (state) {
          case ActivitiesLoadingState():
            return ActivitiesPageView(
              activities: DummyActivities.dummyActivities,
              isLoading: true,
            );
          case ActivitiesLoadedState(
            activities: final List<ActivityModel> activities,
          ):
            return ActivitiesPageView(activities: activities);
          case ActivitiesFailureState(message: final String message):
            return CustomErrorWidget(message: message);

          case ActivitiesCategoriesLoadedState():
            return const SizedBox.shrink();
        }
      },
    );
  }
}
