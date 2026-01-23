import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../data/repos/water_repo.dart';
import '../../../manager/cups_of_water_cubit/cups_of_water_cubit.dart';
import 'water_cups_list.dart';
import 'water_amount_header.dart';

class WaterAmountCard extends StatelessWidget {
  const WaterAmountCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kAppSectionSpacing),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
      child: BlocProvider(
        create: (context) =>
            CupsOfWaterCubit(waterRepo: WaterRepo())..loadData(),
        child: Column(
          children: [
            WaterAmountHeader(),
            const SizedBox(height: 10),
            WaterCupsList(),
          ],
        ),
      ),
    );
  }
}
