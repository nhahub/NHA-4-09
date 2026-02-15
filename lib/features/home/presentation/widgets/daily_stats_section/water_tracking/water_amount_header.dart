import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/core/theming/app_assets.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';
import '../../../../data/models/water_cups_model.dart';
import '../../../manager/cups_of_water_cubit/water_tracking_cubit.dart';

class WaterAmountHeader extends StatelessWidget {
  final bool isWithArrow;
  const WaterAmountHeader({super.key, required this.isWithArrow});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterTrackingCubit, WaterCupsModel>(
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
            if (isWithArrow) ...[
              const Spacer(),
              InkWell(
                onTap: () {
                  context.push(Routes.waterTrackingView,);
                },
                child: SvgPicture.asset(AppAssets.arrowRightIosIcon),
              ),
            ],
          ],
        );
      },
    );
  }
}
