import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/string_extensions.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionHeader extends StatelessWidget {
  const BookedSessionHeader({super.key, required this.bookingModel});

  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            bookingModel.therapistImage.isNullOrEmpty()
                ? kImagePlaceHolder
                : bookingModel.therapistImage!,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(bookingModel.therapistName, style: AppStyles.extraBold15),
              const SizedBox(height: 5),
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
      ],
    );
  }
}
