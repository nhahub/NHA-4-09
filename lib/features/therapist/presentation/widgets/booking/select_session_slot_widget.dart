import 'package:flutter/material.dart';
import 'date_selector_widget.dart';
import 'time_slots_widget.dart';

class SelectSessionSlotWidget extends StatelessWidget {
  const SelectSessionSlotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [DateSelectorWidget(), TimeSlotsWidget()],
    );
  }
}
