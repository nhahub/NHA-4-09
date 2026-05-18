import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../therapist/data/models/booking_model.dart';
import '../../../data/models/dummy/dummy_booked_sessions.dart';
import '../../manager/booking_sessions_cubit/booking_sessions_cubit.dart';
import 'booked_sessions_list_view.dart';

class BookingSessionsBlocBuilder extends StatelessWidget {
  const BookingSessionsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingSessionsCubit, BookingSessionsState>(
      builder: (context, state) {
        switch (state.status) {
          case BookingSessionsStatus.loading:
            return BookedSessionsListView(
              bookings: DummyBookedSessions.dummyBookedSessions,
              isLoading: true,
            );

          case BookingSessionsStatus.success:
            final List<BookingModel> bookings = state.bookings ?? [];
            if (bookings.isEmpty) {
              return const Center(child: Text("No Bookings"));
            }
            return BookedSessionsListView(bookings: bookings);

          case BookingSessionsStatus.failure:
            return CustomErrorWidget(
              message: state.errorMessage ?? "Unknown error",
            );
        }
      },
    );
  }
}
