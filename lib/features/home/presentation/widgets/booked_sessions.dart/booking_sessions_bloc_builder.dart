import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          case GetBookingSessionsLoadingState _:
            return BookedSessionsListView(
              bookings: DummyBookedSessions.dummyBookedSessions,
              isLoading: true,
            );

          case GetBookingSessionsSuccessState _:
            final loadedState = state;
            if (loadedState.bookings.isEmpty) {
              return const Center(child: Text("No Bookings"));
            }
            return BookedSessionsListView(bookings: loadedState.bookings);

          case GetBookingSessionsFailureState _:
            final errorState = state;
            return Center(
              child: Text(
                errorState.errorMessage,
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
