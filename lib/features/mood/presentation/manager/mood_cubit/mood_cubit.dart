import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/errors/failure.dart';
import 'package:moodly/features/home/data/models/feeling_today_model.dart';
import 'package:moodly/features/mood/data/repos/mood_repo.dart';
import 'package:moodly/features/mood/data/services/mood_local_service.dart';

part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  final MoodRepo _moodRepo;
  int? _selectedIndex;

  MoodCubit({required MoodRepo moodRepo})
    : _moodRepo = moodRepo,
      super(MoodInitialState());

  void selectMood({required int index}) {
    if (_selectedIndex == index) return;
    _selectedIndex = index;
    emit(MoodSelectedState(selectedIndex: index));
  }

  Future<void> saveCurrentMood({required bool isDailyMood}) async {
    if (_selectedIndex == null) {
      emit(MoodValidationErrorState());
      return;
    }

    emit(MoodSavingState());

    Either<Failure, void> result = await _moodRepo.saveCurrentMood(
      currentMood: feelingTodayData[_selectedIndex!].feeling,
    );
    result.fold(
      (failure) {
        emit(MoodFailedState(message: failure.message));
      },
      (success) {
        if (isDailyMood) {
          MoodLocalService.setSelectedDailyMood(
            dailyMood: feelingTodayData[_selectedIndex!].feeling,
          );
          MoodLocalService.setHasSelectedDailyMood();
        }
        emit(MoodSavedState());
      },
    );
  }

  void resetSelectedIndex() {
    _selectedIndex = null;
    emit(MoodInitialState());
  }
}
