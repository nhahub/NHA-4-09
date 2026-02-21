import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../data/models/water_cups_model.dart';
import '../../../manager/cups_of_water_cubit/water_tracking_cubit.dart';
import '../shared/app_custom_card.dart';
import 'health_benefits_card.dart';
import 'statistics_card.dart';
import 'water_amount_card.dart';
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
