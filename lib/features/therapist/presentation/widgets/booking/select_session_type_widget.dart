import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/booking_cubit/booking_cubit.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class SelectSessionTypeWidget extends StatelessWidget {
  const SelectSessionTypeWidget({super.key, required this.state});

  final BookingState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select session type:", style: AppStyles.extraBold16),
        const SizedBox(height: 8),
        Row(
          children: [
            ChoiceChip(
              label: const Text("Chat"),
              selected: state.selectedType == 'chat',
              selectedColor: AppColors.bgFill,
              backgroundColor: AppColors.bodyGray.withAlpha(
                alphaFromPercentage(6),
              ),
              onSelected: (_) => cubit.selectType('chat'),
            ),
            const SizedBox(width: 12),
            ChoiceChip(
              label: const Text("Call"),
              selected: state.selectedType == 'call',
              selectedColor: AppColors.bgFill,
              backgroundColor: AppColors.bodyGray.withAlpha(
                alphaFromPercentage(6),
              ),
              onSelected: (_) => cubit.selectType('call'),
            ),
          ],
        ),
      ],
    );
  }
}
