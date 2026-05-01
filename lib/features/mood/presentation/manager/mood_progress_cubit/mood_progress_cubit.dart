import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/mood_chart.dart';
import '../../../data/repos/mood_progress_repo.dart';

part 'mood_progress_state.dart';

class MoodProgressCubit extends Cubit<MoodProgressState> {
  final MoodProgressRepo _moodProgressRepo;

  MoodProgressCubit({required MoodProgressRepo moodProgressRepo})
    : _moodProgressRepo = moodProgressRepo,
      super(const MoodProgressState());

  // Week
  Future<void> getCurrentWeekMood() async {
    emit(state.copyWith(status: MoodProgressStatus.loading));
    try {
      final List<MoodChart> weekMood = await _moodProgressRepo
          .getCurrentWeekMood();
      emit(
        state.copyWith(status: MoodProgressStatus.success, weekMood: weekMood),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MoodProgressStatus.failure,
          failureMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  // Month
  Future<void> getCurrentMonthMood() async {
    emit(state.copyWith(status: MoodProgressStatus.loading));
    try {
      final List<MoodChart> monthMood = await _moodProgressRepo
          .getCurrentMonthMood();

      emit(
        state.copyWith(
          status: MoodProgressStatus.success,
          monthMood: monthMood,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MoodProgressStatus.failure,
          failureMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  // Year
  Future<void> getCurrentYearMood() async {
    emit(state.copyWith(status: MoodProgressStatus.loading));

    try {
      final List<MoodChart> yearMood = await _moodProgressRepo
          .getCurrentYearMood();
      emit(
        state.copyWith(status: MoodProgressStatus.success, yearMood: yearMood),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: MoodProgressStatus.failure,
          failureMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
