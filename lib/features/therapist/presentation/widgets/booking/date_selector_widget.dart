import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/booking_cubit/booking_cubit.dart';
import 'date_selector_list_view.dart';

class DateSelectorWidget extends StatelessWidget {
  const DateSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
          child: Text("Date", style: AppStyles.extraBold17),
        ),
        const SizedBox(height: 12),
        BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            final days = state.availableSlots.keys.toList();
            if (state is BookingLoadingState) {
              return const DateSelectorListView(
                days: [0, 1, 2, 3, 4, 5],
                isLoading: true,
              );
            } else {
              return DateSelectorListView(
                days: days,
                selectedDay: state.selectedDay,
              );
            }
          },
        ),
      ],
    );
  }
}
