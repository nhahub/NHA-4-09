import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/features/home/data/models/water_cups_model.dart';
import 'package:moodly/features/home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/app_custom_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/health_benefits_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/statistics_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/water_amount_card.dart';

class WaterTrackingViewBody extends StatelessWidget {
  const WaterTrackingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          spacing: 12,
          children: [
            const WaterAmountCard(isWithArrow: false),
            AppCustomCard(
              child: BlocBuilder<WaterTrackingCubit, WaterCupsModel>(
                builder: (context, state) {
                  return Column(
                    spacing: 6,
                    children: [
                      StatisticsCard(
                        bgColor: const Color(0xffecfbff),
                        icon: AppAssets.targetIcon,
                        bgIconColor: const Color(0xff2b7fff),
                        progress: "${state.goalProgress}%",
                        title: "Goal Progress",
                      ),
                      StatisticsCard(
                        bgColor: const Color(0xfffbf2fa),
                        icon: AppAssets.increaseIcon,
                        bgIconColor: const Color(0xffad46ff),
                        progress: "${state.remainingAmount} ml",
                        title: "Remaining",
                      ),
                      StatisticsCard(
                        bgColor: const Color(0xffedfdf4),
                        icon: AppAssets.rewardIcon,
                        bgIconColor: const Color(0xff00c950),
                        progress: "${state.filledCount} cups",
                        title: "Glasses (250ml)",
                      ),
                    ],
                  );
                },
              ),
            ),
            const HealthBenefitsCard(),
          ],
        ),
      ),
    );
  }
}
