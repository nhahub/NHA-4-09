import 'package:flutter/material.dart';
import 'package:moodly/core/constants/static.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/features/home/presentation/widgets/feeling_today_section/feeling_today_widget.dart';

class FeelingTodayTable extends StatelessWidget {
  const FeelingTodayTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
        },
        border: TableBorder.all(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
          borderRadius: BorderRadius.circular(16),
        ),
        children: [
          TableRow(
            children: List.generate(5, (index) {
              return FeelingTodayWidget(index: index);
            }),
          ),
        ],
      ),
    );
  }
}
