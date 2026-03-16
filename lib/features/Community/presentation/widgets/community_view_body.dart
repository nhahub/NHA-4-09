import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/mock/posts_data.dart';
import 'post/post_card.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});
  // void _toggleLike(int index) {
  //   setState(() {
  //     if (posts[index].isLiked) {
  //       posts[index].isLiked = false;
  //       posts[index].likes -= 1;
  //     } else {
  //       posts[index].isLiked = true;
  //       posts[index].likes += 1;
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 100,
        left: kAppHorizontalPadding,
        right: kAppHorizontalPadding,
      ),
      child: ListView.separated(
        itemCount: posts.length,
        separatorBuilder: (context, index) => const Divider(
          height: 30,
          thickness: 1,
          color: AppColors.dividerColor,
        ),
        itemBuilder: (context, index) {
          return PostCard(
            postModel: posts[index],
            // onLikeTap: () => _toggleLike(index),
          );
        },
      ),
    );
  }
}
