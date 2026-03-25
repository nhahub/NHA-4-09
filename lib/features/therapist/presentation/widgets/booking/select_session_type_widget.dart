import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/presentation/widgets/mood_progress_section/switch_button.dart';
import '../../../../../core/constants/constants.dart';
import '../../manager/booking_cubit/booking_cubit.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class SelectSessionTypeWidget extends StatelessWidget {
  const SelectSessionTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookingCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Select session type:", style: AppStyles.extraBold17),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: AppColors.bgFill,
              borderRadius: BorderRadius.circular(10),
            ),
            child: BlocBuilder<BookingCubit, BookingState>(
              builder: (context, state) {
                return Row(
                  children: [
                    SwitchButton(
                      title: "Chat",
                      isSelected: state.selectedType == 'chat',
                      onTap: () => cubit.selectType(type: 'chat'),
                    ),
                    SwitchButton(
                      title: "Call",
                      isSelected: state.selectedType == 'call',
                      onTap: () => cubit.selectType(type: 'call'),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
