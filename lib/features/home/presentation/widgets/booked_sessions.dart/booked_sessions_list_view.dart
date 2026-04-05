import 'package:flutter/material.dart';
import '../../../../therapist/data/models/booking_model.dart';
import 'booked_session_card.dart';

class BookedSessionsListView extends StatelessWidget {
  final List<BookingModel> bookings;
  final bool isLoading;
  const BookedSessionsListView({
    super.key,
    required this.bookings,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: bookings.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return BookedSessionCard(bookingModel: bookings[index]);
      },
    );
  }
}
