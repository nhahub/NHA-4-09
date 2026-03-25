import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../therapist/data/models/booking_model.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';

class SessionTypeWidget extends StatelessWidget {
  const SessionTypeWidget({super.key, required this.bookingModel});

  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Colors.grey[200],
      child: SvgPicture.asset(
        bookingModel.sessionType == "call"
            ? AppAssets.videoCallIcon
            : AppAssets.chatIcon,
        width: 30,
        height: 30,
        colorFilter: const ColorFilter.mode(
          AppColors.linkGray,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
