import 'package:moodly/core/constants/constants.dart';

class WaterCupsModel {
  final int currentIndex;
  final List<bool> filledCups;

  const WaterCupsModel({required this.currentIndex, required this.filledCups});

  int get filledCount => filledCups.where((e) => e).length;

  double get amountInLiters => filledCount * 0.25;

  double get goalProgress =>
      filledCups.isEmpty ? 0 : filledCount / filledCups.length * 100;

  int get remainingAmount => (kMaxCups - filledCount) * 250;

  String get formattedAmount {
    if (amountInLiters == 0) return "0";
    if (amountInLiters == 2) return "2";
    return amountInLiters.toStringAsFixed(2);
  }

  WaterCupsModel copyWith({int? currentIndex, List<bool>? filledCups}) {
    return WaterCupsModel(
      currentIndex: currentIndex ?? this.currentIndex,
      filledCups: filledCups ?? this.filledCups,
    );
  }
}
