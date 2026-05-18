import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/time_slot_model.dart';
import 'time_switcher_button.dart';

class TimeSlots extends StatelessWidget {
  final List<TimeSlotModel> slots;
  final TimeSlotModel? selectedSlot;
  const TimeSlots({super.key, required this.slots, this.selectedSlot});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.bgFill,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Wrap(
          spacing: 12,
          runSpacing: 8,
          children: slots
              .map(
                (slot) =>
                    TimeSwitcherButton(slot: slot, selectedSlot: selectedSlot),
              )
              .toList(),
        ),
      ),
    );
  }
}
