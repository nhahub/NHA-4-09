import 'package:flutter/material.dart';
import '../../../../core/theming/app_assets.dart';
import '../../data/models/water_cups_model.dart';
import '../models/water_stats_item.dart';

List<WaterStatItem> buildWaterStats({required WaterCupsModel state}) {
  return [
    WaterStatItem(
      bgColor: const Color(0xffecfbff),
      icon: AppAssets.targetIcon,
      bgIconColor: const Color(0xff2b7fff),
      progress: "${state.goalProgress}%",
      title: "Goal Progress",
    ),
    WaterStatItem(
      bgColor: const Color(0xfffbf2fa),
      icon: AppAssets.increaseIcon,
      bgIconColor: const Color(0xffad46ff),
      progress: "${state.remainingAmount} ml",
      title: "Remaining",
    ),
    WaterStatItem(
      bgColor: const Color(0xffedfdf4),
      icon: AppAssets.rewardIcon,
      bgIconColor: const Color(0xff00c950),
      progress: "${state.filledCount} cups",
      title: "Glasses (250ml)",
    ),
  ];
}
