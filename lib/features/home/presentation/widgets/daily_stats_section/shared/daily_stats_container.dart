import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/features/home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../number_of_steps/number_of_steps_card.dart';
import '../water_tracking/water_amount_card.dart';

class DailyStatsContainer extends StatelessWidget {
  const DailyStatsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.bgFill,
        border: Border.all(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              context.push(
                Routes.waterTrackingView,
                args: context.read<WaterTrackingCubit>(),
              );
            },
            child: const WaterAmountCard(isWithArrow: true),
          ),
          const SizedBox(height: 4),
          const NumberOfStepsCard(),
        ],
      ),
    );
  }
}
