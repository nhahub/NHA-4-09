import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/post_model.dart';
import 'post_card.dart';

class CommunityListView extends StatelessWidget {
  final bool isLoading;
  final List<PostModel> posts;
  final void Function(PostModel post)? onLikeTap;
  final void Function(PostModel post)? onRepeatTap;
  final void Function(PostModel post)? onExportTap;

  const CommunityListView({
    super.key,
    required this.posts,
    this.isLoading = false,
    this.onLikeTap,
    this.onRepeatTap,
    this.onExportTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 100,
        left: kAppHorizontalPadding,
        right: kAppHorizontalPadding,
      ),
      child: Skeletonizer(
        containersColor: Colors.grey.shade50,
        enabled: isLoading,
        child: ListView.separated(
          itemCount: posts.length,
          separatorBuilder: (context, index) => const Divider(
            height: 30,
            thickness: 1,
            color: AppColors.dividerColor,
          ),
          itemBuilder: (context, index) {
            final post = posts[index];
            return PostCard(
              postModel: post,
              onLikeTap:
                  onLikeTap != null ? () => onLikeTap!(post) : null,
              onRepeatTap:
                  onRepeatTap != null ? () => onRepeatTap!(post) : null,
              onExportTap:
                  onExportTap != null ? () => onExportTap!(post) : null,
            );
          },
        ),
      ),
    );
  }
}
