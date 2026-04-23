import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/user_avatar.dart';

class ArticleHeader extends StatelessWidget {
  const ArticleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const UserAvatar(name: "karim", radius: 20, fontSize: 20),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("By Ahmed Motaz", style: AppStyles.medium16),
            Text(
              "7/10/2026",
              style: AppStyles.bold14.copyWith(color: AppColors.bodyGray),
            ),
          ],
        ),
      ],
    );
  }
}
