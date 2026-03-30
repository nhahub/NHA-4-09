import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../therapist/data/models/booking_model.dart';
import '../../../data/models/dummy/dummy_booked_sessions.dart';
import '../../manager/get_booking_sessions_cubit/get_booking_sessions_cubit.dart';
import 'booked_sessions_list_view.dart';

class BookingSessionsBlocBuilder extends StatelessWidget {
  const BookingSessionsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBookingSessionsCubit, GetBookingSessionsState>(
      builder: (context, state) {
        switch (state) {
          case GetBookingSessionsLoadingState():
            return BookedSessionsListView(
              bookings: DummyBookedSessions.dummyBookedSessions,
              isLoading: true,
            );

          case GetBookingSessionsSuccessState(
            :final List<BookingModel> bookings,
          ):
            if (bookings.isEmpty) {
              return const Center(child: Text("No Bookings"));
            }
            return BookedSessionsListView(bookings: bookings);

          case GetBookingSessionsFailureState(:final String errorMessage):
            return Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );

          default:
            return const Center(child: Text("Unknown state"));
        }
      },
    );
  }
}
