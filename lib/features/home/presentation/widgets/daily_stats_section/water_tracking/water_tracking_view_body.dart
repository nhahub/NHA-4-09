import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/data/models/water_cups_model.dart';
import 'package:moodly/features/home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/app_custom_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/health_benefits_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/statistics_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/water_amount_card.dart';
import '../../../../data/local_data/water_stats_data.dart';

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
                  final stats = buildWaterStats(state: state);
                  return Column(
                    spacing: 6,
                    children: stats.map((item) {
                      return StatisticsCard(
                        bgColor: item.bgColor,
                        icon: item.icon,
                        bgIconColor: item.bgIconColor,
                        progress: item.progress,
                        title: item.title,
                      );
                    }).toList(),
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
