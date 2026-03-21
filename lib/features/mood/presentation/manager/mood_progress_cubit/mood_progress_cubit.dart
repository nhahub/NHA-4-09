import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/mood_chart.dart';
import '../../../data/repos/mood_progress_repo.dart';

part 'mood_progress_state.dart';

class MoodProgressCubit extends Cubit<MoodProgressState> {
  final MoodProgressRepo moodProgressRepo;

  MoodProgressCubit({required this.moodProgressRepo})
    : super(const MoodProgressState());

  // Week
  Future<void> getCurrentWeekMood() async {
    emit(state.copyWith(isLoading: true, failureMessage: null));
    final Either<Failure, List<MoodChart>> response = await moodProgressRepo
        .getCurrentWeekMood();

    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, failureMessage: failure.message));
      },
      (data) {
        emit(state.copyWith(isLoading: false, weekMood: data));
      },
    );
  }

  // Month
  Future<void> getCurrentMonthMood() async {
    emit(state.copyWith(isLoading: true, failureMessage: null));

    final Either<Failure, List<MoodChart>> response = await moodProgressRepo
        .getCurrentMonthMood();

    response.fold(
      (failure) {
        state.copyWith(isLoading: false, failureMessage: failure.message);
      },
      (data) {
        emit(state.copyWith(isLoading: false, monthMood: data));
      },
    );
  }

  // Year
  Future<void> getCurrentYearMood() async {
    emit(state.copyWith(isLoading: true, failureMessage: null));

    final Either<Failure, List<MoodChart>> response = await moodProgressRepo
        .getCurrentYearMood();

    response.fold(
      (failure) {
        emit(state.copyWith(isLoading: false, failureMessage: failure.message));
      },
      (data) {
        emit(state.copyWith(isLoading: false, yearMood: data));
      },
    );
  }
}
