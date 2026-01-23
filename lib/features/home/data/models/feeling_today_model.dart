import '../../../../core/theming/app_assets.dart';

class FeelingTodayModel {
  final String feeling;
  final String icon;

  const FeelingTodayModel({required this.feeling, required this.icon});
}

List<FeelingTodayModel> feelingTodayData = [
  const FeelingTodayModel(feeling: "V. Bad", icon: AppAssets.veryBad),
  const FeelingTodayModel(feeling: "Bad", icon: AppAssets.bad),
  const FeelingTodayModel(feeling: "Neutral", icon: AppAssets.neutral),
  const FeelingTodayModel(feeling: "Good", icon: AppAssets.good),
  const FeelingTodayModel(feeling: "V. Good", icon: AppAssets.veryGood),
];
