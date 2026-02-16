import 'package:flutter/material.dart';
import '../../../../core/helpers/alpha_from_percent.dart';
import '../../../../core/theming/app_colors.dart';
import 'mood_widget.dart';

class MoodTable extends StatelessWidget {
  const MoodTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
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
            return MoodWidget(index: index);
          }),
        ),
      ],
    );
  }
}
