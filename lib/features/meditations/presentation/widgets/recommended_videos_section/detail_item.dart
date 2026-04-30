import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_styles.dart';

class DetailItem extends StatelessWidget {
  final String label;
  final Color labelColor;
  final String value;

  const DetailItem({
    super.key,
    required this.label,
    required this.labelColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppStyles.medium13.copyWith(color: labelColor)),
        Text(value, style: AppStyles.bold15),
      ],
    );
  }
}
