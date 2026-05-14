import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';

class NoCommentsWidget extends StatelessWidget {
  const NoCommentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No comments yet. Be the first to comment!',
        style: TextStyle(color: AppColors.bodyGray),
      ),
    );
  }
}
