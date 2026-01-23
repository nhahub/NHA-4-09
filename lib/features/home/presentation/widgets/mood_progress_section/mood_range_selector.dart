import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../domain/enums/mood_time_range.dart';
import '../../manager/mood_range_cubit/mood_range_cubit.dart';
import 'range_button.dart';

class MoodRangeSelector extends StatelessWidget {
  const MoodRangeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodRangeCubit, MoodTimeRange>(
      builder: (context, selectedRange) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.bgFill,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              RangeButton(
                title: MoodTimeRange.weekly.title,
                isSelected: selectedRange == MoodTimeRange.weekly,
                onTap: () => context.read<MoodRangeCubit>().changeRange(
                  MoodTimeRange.weekly,
                ),
              ),
              RangeButton(
                title: MoodTimeRange.monthly.title,
                isSelected: selectedRange == MoodTimeRange.monthly,
                onTap: () => context.read<MoodRangeCubit>().changeRange(
                  MoodTimeRange.monthly,
                ),
              ),
              RangeButton(
                title: MoodTimeRange.yearly.title,
                isSelected: selectedRange == MoodTimeRange.yearly,
                onTap: () => context.read<MoodRangeCubit>().changeRange(
                  MoodTimeRange.yearly,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
