import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/data/models/water_cups_model.dart';
import 'package:moodly/features/home/data/repos/water_repo.dart';

class CupsOfWaterCubit extends Cubit<WaterCupsModel> {
  final WaterRepo waterRepo;

  CupsOfWaterCubit({required this.waterRepo})
    : super(
        WaterCupsModel(
          currentIndex: 0,
          filledCups: List.generate(8, (_) => false),
        ),
      );

  Future<void> loadData() async {
    final data = await waterRepo.getWaterCups();
    emit(data);
  }

  Future<void> fillCurrentCup() async {
    final int index = state.currentIndex;
    if (index >= state.filledCups.length) return;

    final List<bool> updatedCups = List<bool>.from(state.filledCups);
    updatedCups[index] = true;

    final updatedState = state.copyWith(
      filledCups: updatedCups,
      currentIndex: index < state.filledCups.length - 1 ? index + 1 : index,
    );

    emit(updatedState);
    await waterRepo.saveWaterCups(updatedState);
  }
}
