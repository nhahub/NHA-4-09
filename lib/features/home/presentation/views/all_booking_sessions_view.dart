import 'package:flutter/material.dart';

import '../widgets/booked_sessions.dart/booking_sessions_bloc_builder.dart';
import '../widgets/shared/back_button_appbar.dart';

class AllBookingSessionsView extends StatelessWidget {
  const AllBookingSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "All Booking Sessions"),
      body: BookingSessionsBlocBuilder(),
    );
  }
}
