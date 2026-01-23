import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../data/models/water_cups_model.dart';
import '../../../manager/cups_of_water_cubit/cups_of_water_cubit.dart';
import '../shared/custom_three_dots_icon.dart';

class WaterAmountHeader extends StatelessWidget {
  const WaterAmountHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CupsOfWaterCubit, WaterCupsModel>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              "Water",
              style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
            ),
            const SizedBox(width: 10),
            Text("${state.formattedAmount}L", style: AppStyles.extraBold21),
            const SizedBox(width: 5),
            Text(
              "/ 2L",
              style: AppStyles.extraBold15.copyWith(color: AppColors.bodyGray),
            ),
            const Spacer(),
            GestureDetector(onTap: () {}, child: const CustomThreeDotsIcon()),
          ],
        );
      },
    );
  }
}
