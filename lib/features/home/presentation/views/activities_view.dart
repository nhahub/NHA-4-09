import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/presentation/manager/activities_cubit/activities_cubit.dart';

import '../widgets/activities_section/activities_bloc_builder.dart';
import '../widgets/shared/back_button_appbar.dart';

class ActivitiesView extends StatefulWidget {
  final String categoryId;
  const ActivitiesView({super.key, required this.categoryId});

  @override
  State<ActivitiesView> createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
  @override
  void initState() {
    super.initState();
    context.read<ActivitiesCubit>().getActivities(
      categoryId: widget.categoryId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Activities"),
      body: SafeArea(
        bottom: false,
        child: ActivitiesBlocBuilder(),
      ),
    );
  }
}
