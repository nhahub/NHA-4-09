import 'package:flutter/material.dart';

import '../../../data/models/activity/activity_model.dart';

class ActivitiesListView extends StatelessWidget {
  final List<ActivityModel> activities;
  final bool isLoading;
  const ActivitiesListView({
    super.key,
    required this.activities,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
