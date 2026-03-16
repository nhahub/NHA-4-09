import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/premium_container.dart';
import '../../../data/models/post_model.dart';
import '../../helpers/date_time_extension.dart';

class PostHeader extends StatelessWidget {
  final PostModel postModel;

  const PostHeader({super.key, required this.postModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '@${postModel.userName}',
              style: AppStyles.extraBold15,
              overflow: TextOverflow.ellipsis,
            ),
            if (postModel.isPremium) ...[
              const SizedBox(width: 6),
              const PremiumContainer(),
            ],
          ],
        ),
        Text(
          postModel.createdAt.timeAgo(),
          style: AppStyles.medium13.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}
