import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/features/home/presentation/manager/cups_of_water_cubit/water_tracking_cubit.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/surface_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/water_amount_card.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/widgets/app_section_header.dart';

class DailyStatsSection extends StatelessWidget {
  const DailyStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Daily Stats"),
        const SizedBox(height: kAppSectionSpacing),
        SurfaceCard(
          child: GestureDetector(
            onTap: () {
              context.push(
                Routes.waterTrackingView,
                args: context.read<WaterTrackingCubit>(),
              );
            },
            child: const WaterAmountCard(isWithArrow: true),
          ),
        ),
      ],
    );
  }
}
