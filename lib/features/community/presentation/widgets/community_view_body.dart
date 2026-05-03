import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../manager/community_feed_cubit/community_feed_cubit.dart';
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
    return BlocBuilder<CommunityFeedCubit, CommunityFeedState>(
      builder: (context, state) {
        if (state.status == CommunityFeedStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == CommunityFeedStatus.failure) {
          return Center(
            child: Text(state.errorMessage ?? 'Failed to load posts'),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(
            bottom: 100,
            left: kAppHorizontalPadding,
            right: kAppHorizontalPadding,
          ),
          child: ListView.separated(
            itemCount: state.posts.length,
            separatorBuilder: (context, index) => const Divider(
              height: 30,
              thickness: 1,
              color: AppColors.dividerColor,
            ),
            itemBuilder: (context, index) {
              return PostCard(postModel: state.posts[index]);
            },
          ),
        );
      },
    );
  }
}
