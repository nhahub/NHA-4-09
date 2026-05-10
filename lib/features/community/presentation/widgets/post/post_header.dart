import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
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
        Text(
          '@${postModel.userName}',
          style: AppStyles.extraBold15,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          postModel.createdAt.timeAgo(),
          style: AppStyles.medium13.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}
