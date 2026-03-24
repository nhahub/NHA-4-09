import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/therapist/presentation/widgets/booking/date_item.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../manager/booking_cubit/booking_cubit.dart';

class DateSelectorWidget extends StatelessWidget {
  const DateSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        final days = state.availableSlots.keys.toList();
        if (days.isEmpty) {
          return const Center(
            child: CustomCircularProgressIndicator(color: AppColors.brandGreen),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
              child: Text("Date", style: AppStyles.extraBold17),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final day = days[index];
                  final isSelected = state.selectedDay == day;
                  return Padding(
                    padding: EdgeInsets.only(
                      right: index == days.length - 1
                          ? kAppHorizontalPadding
                          : 0,
                      left: index == 0 ? kAppHorizontalPadding : 0,
                    ),
                    child: DateItem(day: day, isSelected: isSelected),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
