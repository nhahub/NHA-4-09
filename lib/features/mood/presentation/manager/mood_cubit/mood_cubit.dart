import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/feeling_today_model.dart';
import '../../../data/repos/mood_repo.dart';
import '../../../data/services/mood_local_service.dart';

part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  final MoodRepo _moodRepo;
  final MoodLocalService _moodLocalService;

  int? _selectedIndex;

  MoodCubit({
    required MoodRepo moodRepo,
    required MoodLocalService moodLocalService,
  }) : _moodRepo = moodRepo,
       _moodLocalService = moodLocalService,
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

    try {
      await _moodRepo.saveCurrentMood(
        currentMood: feelingTodayData[_selectedIndex!].feeling,
      );
      if (isDailyMood) {
        _moodLocalService.setSelectedDailyMood(
          dailyMood: feelingTodayData[_selectedIndex!].feeling,
        );
      }
      emit(MoodSavedState());
    } catch (e) {
      emit(MoodFailedState(message: ApiErrorHandler.handle(error: e).message));
    }
  }

  void resetSelectedIndex() {
    _selectedIndex = null;
    emit(MoodInitialState());
  }
}
