import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/features/therapist/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/select_session_slot_widget.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/select_session_type_widget.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/session_price.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_text_button.dart';

class BookingSessionBlocBuilder extends StatelessWidget {
  const BookingSessionBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return Column(
          spacing: 20,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: SelectSessionTypeWidget(state: state),
            ),
            const SelectSessionSlotWidget(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kAppHorizontalPadding,
              ),
              child: SessionPrice(
                price: state.price,
                priceAfterDiscount: state.priceAfterDiscount,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kAppHorizontalPadding,
                ),
                child: AppTextButton(
                  onPressed: () {
                    context.push(
                      Routes.subscribeView,
                      args: {"price": state.price.toDouble()},
                    );
                  },
                  buttonText: "Pay Now",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
