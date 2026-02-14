part of 'mood_cubit.dart';

sealed class MoodState extends Equatable {
  const MoodState();

  @override
  List<Object> get props => [];
}

class MoodInitialState extends MoodState {}

class MoodCheckingState extends MoodState {}

class MoodEmptyState extends MoodState {}

class MoodSelectedState extends MoodState {
  final int index;
  const MoodSelectedState({required this.index});
}

class MoodSavingState extends MoodState {}

class MoodSavedState extends MoodState {}

class MoodErrorState extends MoodState {
  final String message;
  const MoodErrorState({required this.message});
}
