import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/therapist/presentation/manager/booking_cubit/booking_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/helpers/get_day_name.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class DateItem extends StatelessWidget {
  const DateItem({super.key, required this.day, required this.isSelected});

  final int day;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<BookingCubit>().selectDay(day: day),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandGreen : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            getDayName(dayOfWeek: day),
            style: AppStyles.bold14.copyWith(
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
