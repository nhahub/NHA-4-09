import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import 'date_item.dart';

class DateSelectorListView extends StatelessWidget {
  const DateSelectorListView({
    super.key,
    required this.days,
    this.isLoading = false,
    this.selectedDay,
  });
  final int? selectedDay;
  final List<int> days;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey[50],
      enabled: isLoading,
      child: SizedBox(
        height: 50,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: days.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            final day = days[index];
            final isSelected = selectedDay == day;
            return Padding(
              padding: EdgeInsets.only(
                right: index == days.length - 1 ? kAppHorizontalPadding : 0,
                left: index == 0 ? kAppHorizontalPadding : 0,
              ),
              child: DateItem(day: day, isSelected: isSelected),
            );
          },
        ),
      ),
    );
  }
}
