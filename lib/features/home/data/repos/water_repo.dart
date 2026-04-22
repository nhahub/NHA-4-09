// water_repo.dart
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/data/services/water_local_service.dart';

import '../models/water/water_cups_model.dart';

class WaterRepo {
  final WaterLocalService _waterLocalService;

  WaterRepo({required WaterLocalService waterLocalService})
    : _waterLocalService = waterLocalService;
  Future<WaterCupsModel> getWaterCups() async {
    final int currentCups = await _waterLocalService.getCurrentCups();
    return _buildModel(currentCups);
  }

  Future<WaterCupsModel> incrementCup() async {
    final currentCups = await _waterLocalService.incrementCup();
    return _buildModel(currentCups);
  }

  Future<void> resetDailyCups() async {
    await _waterLocalService.resetCups();
  }

  WaterCupsModel _buildModel(int currentCups) {
    final List<bool> filledCups = List.generate(
      kMaxCups,
      (index) => index < currentCups,
    );
    return WaterCupsModel(
      currentIndex: currentCups < kMaxCups ? currentCups : kMaxCups - 1,
      filledCups: filledCups,
    );
  }
}
