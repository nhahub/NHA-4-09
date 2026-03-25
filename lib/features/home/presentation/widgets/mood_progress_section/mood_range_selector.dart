import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../domain/enums/mood_time_range.dart';
import '../../manager/mood_range_cubit/mood_range_cubit.dart';
import 'switch_button.dart';

class MoodRangeSelector extends StatelessWidget {
  const MoodRangeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodRangeCubit, MoodPeriod>(
      builder: (context, selectedRange) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.bgFill,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SwitchButton(
                title: MoodPeriod.week.title,
                isSelected: selectedRange == MoodPeriod.week,
                onTap: () =>
                    context.read<MoodRangeCubit>().changeRange(MoodPeriod.week),
              ),
              SwitchButton(
                title: MoodPeriod.month.title,
                isSelected: selectedRange == MoodPeriod.month,
                onTap: () => context.read<MoodRangeCubit>().changeRange(
                  MoodPeriod.month,
                ),
              ),
              SwitchButton(
                title: MoodPeriod.year.title,
                isSelected: selectedRange == MoodPeriod.year,
                onTap: () =>
                    context.read<MoodRangeCubit>().changeRange(MoodPeriod.year),
              ),
            ],
          ),
        );
      },
    );
  }
}
