import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/expandable_text.dart';

class BookDescription extends StatelessWidget {
  final String description;
  const BookDescription({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      text: description,
      maxLines: 5,
      style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
    );
  }
}
