part of 'activities_cubit.dart';

sealed class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object?> get props => [];
}

class ActivitiesLoadingState extends ActivitiesState {}

class ActivitiesLoadedState extends ActivitiesState {
  final List<ActivityModel> activities;

  const ActivitiesLoadedState({required this.activities});

  @override
  List<Object?> get props => [activities];
}

class ActivitiesCategoriesLoadedState extends ActivitiesState {
  final List<ActivityCategoryModel> categories;

  const ActivitiesCategoriesLoadedState({required this.categories});

  @override
  List<Object?> get props => [categories];
}

class ActivitiesFailureState extends ActivitiesState {
  final String message;
  const ActivitiesFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
