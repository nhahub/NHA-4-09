import '../models/water_cups_model.dart';

class WaterRepo {
  Future<WaterCupsModel> getWaterCups() async {
    return WaterCupsModel(
      currentIndex: 0,
      filledCups: List.generate(8, (_) => false),
    );
  }

  Future<void> saveWaterCups(WaterCupsModel model) async {}
}
