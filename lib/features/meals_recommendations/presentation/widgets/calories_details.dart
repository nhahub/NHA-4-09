import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_styles.dart';

class CaloriesDetails extends StatelessWidget {
  final String title;
  final num value;
  final Color color;
  const CaloriesDetails({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Container(
          width: 30,
          height: 8,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.semiBold17.copyWith(color: Colors.grey.shade400),
            ),
            Text("${value}g", style: AppStyles.semiBold17),
          ],
        ),
      ],
    );
  }
}
