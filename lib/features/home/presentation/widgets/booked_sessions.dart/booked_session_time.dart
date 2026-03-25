import 'package:flutter/material.dart';

import '../../../../../core/extensions/to_custom_format.dart';
import '../../../../therapist/data/models/booking_model.dart';
import 'session_time_widget.dart';
import 'session_type_widget.dart';

class BookedSessionTime extends StatelessWidget {
  final BookingModel bookingModel;

  const BookedSessionTime({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            spacing: 6,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SessionTimeWidget(
                date: bookingModel.slotStartTime.toCustomFormat(),
              ),
              SessionTimeWidget(
                date: bookingModel.slotEndTime.toCustomFormat(),
              ),
            ],
          ),
        ),
        SessionTypeWidget(bookingModel: bookingModel),
      ],
    );
  }
}
