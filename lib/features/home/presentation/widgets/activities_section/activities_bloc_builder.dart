import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/dummy/dummy_activities.dart';
import '../../manager/activities_cubit/activities_cubit.dart';
import 'activities_page_view.dart';

class ActivitiesBlocBuilder extends StatelessWidget {
  const ActivitiesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivitiesCubit, ActivitiesState>(
      builder: (context, state) {
        switch (state.status) {
          case ActivitiesStatus.loading:
            return ActivitiesPageView(
              activities: DummyActivities.dummyActivities,
              isLoading: true,
            );
          case ActivitiesStatus.success:
            return ActivitiesPageView(activities: state.activities!);
          case ActivitiesStatus.failure:
            return CustomErrorWidget(message: state.error!);
        }
      },
    );
  }
}
