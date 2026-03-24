import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/build_snack_bar.dart';
import 'package:moodly/features/therapist/presentation/manager/booking_cubit/booking_cubit.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_text_button.dart';

class BookingSessionButton extends StatelessWidget {
  const BookingSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: BlocBuilder<BookingCubit, BookingState>(
          builder: (context, state) {
            return AppTextButton(
              onPressed: () {
                validateThenBookSession(context, state);
              },
              buttonText: "Book Now",
            );
          },
        ),
      ),
    );
  }

  void validateThenBookSession(BuildContext context, BookingState state) {
    if (state.selectedType == null) {
      return warningSnackBar(
        context: context,
        message: "Please select a session type.",
      );
    }

    if (state.selectedDay == null) {
      return warningSnackBar(context: context, message: "Please select a day.");
    }

    if (state.selectedSlot == null) {
      return warningSnackBar(
        context: context,
        message: "Please select a time slot.",
      );
    }

    context.push(
      Routes.subscribeView,
      args: {
        "price": state.price.toDouble(),
        "sessionType": state.selectedType,
        "therapistId": state.therapist.id,
        "slotId": state.selectedSlot!.id,
      },
    );
  }
}
