import 'package:flutter/material.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/booking_session_bloc_builder.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/therapist_model.dart';

class BookingSessionView extends StatelessWidget {
  final TherapistModel therapist;
  const BookingSessionView({super.key, required this.therapist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Booking Session"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(therapist.name, style: AppStyles.extraBold20),
            const SizedBox(height: 16),
            const BookingSessionBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
