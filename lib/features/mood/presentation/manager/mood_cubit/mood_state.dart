part of 'mood_cubit.dart';

sealed class MoodState extends Equatable {
  const MoodState();

  @override
  List<Object> get props => [];
}

class MoodInitialState extends MoodState {}

class MoodSelectedState extends MoodState {
  final int selectedIndex;
  const MoodSelectedState({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}

class MoodSavingState extends MoodState {}

class MoodSavedState extends MoodState {}

class MoodFailedState extends MoodState {
  final String message;
  const MoodFailedState({required this.message});

  @override
  List<Object> get props => [message];
}

class MoodValidationErrorState extends MoodState {}
