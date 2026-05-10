import 'package:flutter/material.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/post_model.dart';
import '../comments/comments_bottom_sheet.dart';
import 'action_item.dart';

class PostActions extends StatelessWidget {
  final PostModel post;
  final VoidCallback? onLikeTap;

  const PostActions({super.key, required this.post, this.onLikeTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ActionItem(
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
                    child: CommentsBottomSheet(postId: post.id),
                  ),
                );
              },
            ),
            const SizedBox(width: 24),
            ActionItem(
              iconSvg: AppAssets.repeatIcon,
              count: post.sharesCount,
              onTap: () {
                // Share action
              },
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
        ),
        ActionItem(
          iconSvg: AppAssets.exportIcon,
          onTap: () {
            // Share action
          },
          withCount: false,
        ),
      ],
    );
  }
}
