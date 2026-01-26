import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import 'feeling_today_widget.dart';

class FeelingTodayTable extends StatelessWidget {
  const FeelingTodayTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0.33),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 0.67,
            spreadRadius: -1,
          ),
          BoxShadow(
            offset: const Offset(0, 2),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(12)),
            blurRadius: 4,
            spreadRadius: -1,
          ),
        ],
      ),
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
