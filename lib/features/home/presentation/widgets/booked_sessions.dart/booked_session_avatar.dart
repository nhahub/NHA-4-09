import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionAvatar extends StatelessWidget {
  const BookedSessionAvatar({super.key, required this.bookingModel});

  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[200],
      child: ClipOval(
        child: Image.network(
          bookingModel.therapistImage.isNotEmpty
              ? bookingModel.therapistImage
              : kImagePlaceHolder,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          cacheWidth: 180,
          cacheHeight: 180,

          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.brandGreen,
                strokeWidth: 2,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 60,
              height: 60,
              color: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }
}
