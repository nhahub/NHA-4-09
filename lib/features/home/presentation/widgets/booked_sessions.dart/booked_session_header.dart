import 'package:flutter/material.dart';
import 'booked_session_avatar.dart';
import 'cancel_session_button.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionHeader extends StatelessWidget {
  const BookedSessionHeader({super.key, required this.bookingModel});

  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookedSessionAvatar(bookingModel: bookingModel),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bookingModel.therapistName, style: AppStyles.extraBold15),
              Text(
                bookingModel.therapistSpeciality,
                style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ],
          ),
        ),
        CancelSessionButton(bookingModel: bookingModel),
      ],
    );
  }
}
