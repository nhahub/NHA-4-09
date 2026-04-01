import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class PostContent extends StatelessWidget {
  final String content;

  const PostContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
    );
  }
}
