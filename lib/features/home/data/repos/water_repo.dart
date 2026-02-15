// water_repo.dart
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/data/services/water_local_service.dart';

import '../models/water_cups_model.dart';

class WaterRepo {
  Future<WaterCupsModel> getWaterCups() async {
    final int currentCups = await WaterLocalService.getCurrentCups();
    return _buildModel(currentCups);
  }

  Future<WaterCupsModel> incrementCup() async {
    final currentCups = await WaterLocalService.incrementCup();
    return _buildModel(currentCups);
  }

  Future<void> resetDailyCups() async {
    await WaterLocalService.resetCups();
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
