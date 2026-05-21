
import 'package:flutter/material.dart';

import '../../../../../core/helpers/logger.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/post_model.dart';
import '../comments/comments_bottom_sheet.dart';
import 'action_item.dart';

class PostActions extends StatelessWidget {
  final PostModel post;
  final VoidCallback? onLikeTap;
  final VoidCallback? onRepeatTap;
  final VoidCallback? onExportTap;

  const PostActions({
    super.key,
    required this.post,
    this.onLikeTap,
    this.onRepeatTap,
    this.onExportTap,
  });

  @override
  Widget build(BuildContext context) {
    Logger.log(post.commentsCount.toString());
    return Row(
      children: [
        ActionItem(
          key: ValueKey(post.id + post.commentsCount.toString()),
          iconSvg: AppAssets.chatCircleIcon,
          count: post.commentsCount,
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: CommentsBottomSheet(post: post),
              ),
            );
          },
        ),
        const SizedBox(width: 24),
        ActionItem(
          iconSvg: AppAssets.repeatIcon,
          count: post.sharesCount,
          onTap: () => onRepeatTap?.call(),
        ),
        const SizedBox(width: 24),
        ActionItem(
          iconSvg: post.isLikedByCurrentUser
              ? AppAssets.heartFillIcon
              : AppAssets.heartIcon,
          countColor: post.isLikedByCurrentUser ? AppColors.lightRed : null,
          count: post.loveCount,
          onTap: () {
            onLikeTap?.call();
          },
        ),
      ],
    );
  }
}
