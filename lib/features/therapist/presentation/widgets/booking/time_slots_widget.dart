import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/datetime_extensions.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/booking_cubit/booking_cubit.dart';

class TimeSlotsWidget extends StatelessWidget {
  const TimeSlotsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        if (state.selectedDay == null) return const SizedBox.shrink();

        final slots = state.availableSlots[state.selectedDay!] ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text("Time", style: AppStyles.extraBold17),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: slots
                    .map(
                      (slot) => ChoiceChip(
                        label: Text("${slot.startTime.formatHHmm()} PM"),
                        selected: state.selectedSlot == slot,
                        onSelected: (_) =>
                            context.read<BookingCubit>().selectSlot(slot: slot),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
