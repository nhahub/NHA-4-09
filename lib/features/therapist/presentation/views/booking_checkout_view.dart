import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/therapist_model.dart';
import '../manager/booking_cubit/booking_cubit.dart';
import '../widgets/booking/select_session_type_widget.dart';
import '../widgets/booking/session_price.dart';
import '../../../../../core/theming/app_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingCheckoutView extends StatelessWidget {
  final TherapistModel therapist;
  const BookingCheckoutView({super.key, required this.therapist});

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
            BlocBuilder<BookingCubit, BookingState>(
              builder: (context, state) {
                return Column(
                  children: [
                    SelectSessionTypeWidget(state: state),
                    const SizedBox(height: 20),
                    SessionPrice(
                      price: state.price,
                      priceAfterDiscount: state.priceAfterDiscount,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(onPressed: () {}, buttonText: "Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}
