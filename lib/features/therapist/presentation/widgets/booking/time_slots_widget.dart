import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/booking_cubit/booking_cubit.dart';
import 'time_slots.dart';

class TimeSlotsWidget extends StatelessWidget {
  const TimeSlotsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state.selectedDay == null) {
          return const SizedBox.shrink();
        }
        final slots = state.availableSlots[state.selectedDay] ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text("Time", style: AppStyles.extraBold17),
                const SizedBox(height: 12),
                TimeSlots(
                  slots: slots,
                  selectedSlot: state.selectedSlot,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

