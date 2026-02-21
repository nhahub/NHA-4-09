// cups_of_water_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';

import '../../../data/models/water_cups_model.dart';
import '../../../data/repos/water_repo.dart';

class WaterTrackingCubit extends Cubit<WaterCupsModel> {
  final WaterRepo waterRepo;

  WaterTrackingCubit({required this.waterRepo})
    : super(
        WaterCupsModel(
          currentIndex: 0,
          filledCups: List.generate(kMaxCups, (_) => false),
        ),
      );

  Future<void> loadData() async {
    final WaterCupsModel data = await waterRepo.getWaterCups();
    emit(data);
  }

  Future<void> fillCurrentCup() async {
    final WaterCupsModel updatedState = await waterRepo.incrementCup();
    emit(updatedState);
  }

  Future<void> resetDailyCups() async {
    await waterRepo.resetDailyCups();
    await loadData();
  }
}
