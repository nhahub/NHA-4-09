import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/extensions/context_extensions.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/app_section_header.dart';
import '../../../manager/cups_of_water_cubit/water_tracking_cubit.dart';
import '../water_tracking/water_amount_card.dart';
import 'surface_card.dart';

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
