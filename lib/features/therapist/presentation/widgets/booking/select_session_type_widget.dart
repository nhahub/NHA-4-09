import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/home/presentation/widgets/mood_progress_section/range_button.dart';
import '../../manager/booking_cubit/booking_cubit.dart';
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
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.bgFill,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              RangeButton(
                title: "Chat",
                isSelected: state.selectedType == 'chat',
                onTap: () => cubit.selectType('chat'),
              ),
              RangeButton(
                title: "Call",
                isSelected: state.selectedType == 'call',
                onTap: () => cubit.selectType('call'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
