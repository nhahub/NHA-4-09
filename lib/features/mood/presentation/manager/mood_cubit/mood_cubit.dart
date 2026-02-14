import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/mood/data/repos/mood_repo.dart';

part 'mood_state.dart';

class MoodCubit extends Cubit<MoodState> {
  final MoodRepo _moodRepo;

  int? selectedIndex;

  MoodCubit({required MoodRepo moodRepo})
    : _moodRepo = moodRepo,
      super(MoodInitialState());

  // Future<void> checkTodayMood() async {
  //   emit(MoodCheckingState());
  //   final exists = await moodRepo.hasDailyMood(getUser()!.userId);
  //   if (exists) {
  //     emit(MoodSavedState());
  //   } else {
  //     emit(MoodEmptyState());
  //   }
  // }

  void selectMood({required int index}) {
    selectedIndex = index;
    emit(MoodSelectedState(index: index));
  }

  Future<void> saveDailyMood({required String currentMood}) async {
    emit(MoodSavingState());
    try {
      await _moodRepo.saveCurrentMood(currentMood: currentMood);
      emit(MoodSavedState());
    } catch (e) {
      emit(MoodErrorState(message: e.toString()));
    }
  }
}
