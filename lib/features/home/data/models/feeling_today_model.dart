import 'package:moodly/core/theming/app_assets.dart';

class FeelingTodayModel {
  final String feeling;
  final String icon;

  const FeelingTodayModel({required this.feeling, required this.icon});
}

List<FeelingTodayModel> feelingTodayData = [
  FeelingTodayModel(feeling: "V. Bad", icon: AppAssets.veryBad),
  FeelingTodayModel(feeling: "Bad", icon: AppAssets.bad),
  FeelingTodayModel(feeling: "Neutral", icon: AppAssets.neutral),
  FeelingTodayModel(feeling: "Good", icon: AppAssets.good),
  FeelingTodayModel(feeling: "V. Good", icon: AppAssets.veryGood),
];
