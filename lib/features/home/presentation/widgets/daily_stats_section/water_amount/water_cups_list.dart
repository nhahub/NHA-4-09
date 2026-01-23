import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theming/app_assets.dart';
import '../../../../data/models/water_cups_model.dart';
import '../../../manager/cups_of_water_cubit/cups_of_water_cubit.dart';
import 'add_bottel_icon.dart';

class WaterCupsList extends StatelessWidget {
  const WaterCupsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CupsOfWaterCubit, WaterCupsModel>(
      builder: (context, state) {
        return Wrap(
          spacing: 2,
          runSpacing: 8,
          children: List.generate(state.filledCups.length, (index) {
            final isFilled = state.filledCups[index];
            final isCurrent = index == state.currentIndex;

            return GestureDetector(
              onTap: isCurrent && !isFilled
                  ? () => context.read<CupsOfWaterCubit>().fillCurrentCup()
                  : null,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: isFilled ? 1 : 0.5,
                    child: Image.asset(
                      AppAssets.glass,
                      height: 52,
                      width: 38.74,
                    ),
                  ),
                  if (isCurrent && !isFilled) const AddBottelIcon(),
                ],
              ),
            );
          }),
        );
      },
    );
  }
}
