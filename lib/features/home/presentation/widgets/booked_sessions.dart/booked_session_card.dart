import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import 'booked_session_header.dart';
import 'booked_session_time.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import 'booked_session_actions.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionCard extends StatelessWidget {
  const BookedSessionCard({super.key, required this.bookingModel});
  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BookedSessionActions.handleTap(
        context: context,
        bookingModel: bookingModel,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.bgFill,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
              blurRadius: 4,
              spreadRadius: -1,
            ),
          ],
        ),
        child: Column(
          children: [
            BookedSessionHeader(bookingModel: bookingModel),
            const SizedBox(height: 10),
            BookedSessionTime(bookingModel: bookingModel),
          ],
        ),
      ),
    );
  }
}
