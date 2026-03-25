import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionTime extends StatelessWidget {
  final BookingModel bookingModel;

  const BookedSessionTime({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          // bookingModel.slotStartTime.toCustomFormat(),
          "12:00 PM",
          style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
        ),
        Text(
          // bookingModel.slotEndTime.toCustomFormat(),
          "12:00 PM",
          style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}
