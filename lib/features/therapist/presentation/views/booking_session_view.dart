import 'package:flutter/material.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/booking_session_bloc_builder.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/therapist_model.dart';

class BookingSessionView extends StatelessWidget {
  final TherapistModel therapist;
  const BookingSessionView({super.key, required this.therapist});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Booking Session"),
      body: BookingSessionBlocBuilder(),
    );
  }
}
