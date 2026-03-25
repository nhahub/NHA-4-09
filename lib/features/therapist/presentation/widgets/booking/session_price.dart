import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/booking_cubit/booking_cubit.dart';

class SessionPrice extends StatelessWidget {
  const SessionPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Price:", style: AppStyles.extraBold17),
          const SizedBox(height: 8),
          BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final double price = state.price;
              final double priceAfterDiscount = state.priceAfterDiscount;
              return Row(
                children: [
                  if (price != priceAfterDiscount)
                    Text(
                      "\$${price.toStringAsFixed(2)}",
                      style: AppStyles.bold14.copyWith(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  const SizedBox(width: 8),
                  Text(
                    "\$${priceAfterDiscount.toStringAsFixed(2)}",
                    style: AppStyles.extraBold17.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
