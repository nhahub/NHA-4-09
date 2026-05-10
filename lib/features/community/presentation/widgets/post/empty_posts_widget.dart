import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class EmptyPostsWidget extends StatelessWidget {
  const EmptyPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No posts yet!",
        style: AppStyles.extraBold15.copyWith(color: AppColors.bodyGray),
      ),
    );
  }
}
