import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/dummy/dummy_posts.dart';
import '../../helpers/community_share_helper.dart';
import '../../manager/community_feed_cubit/community_feed_cubit.dart';
import 'community_list_view.dart';
import 'empty_posts_widget.dart';

class CommunityBlocBuilder extends StatelessWidget {
  const CommunityBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityFeedCubit, CommunityFeedState>(
      builder: (context, state) {
        final cubit = context.read<CommunityFeedCubit>();
        switch (state.status) {
          case CommunityFeedStatus.loading:
            return CommunityListView(posts: DummyPosts.posts, isLoading: true);
          case CommunityFeedStatus.success:
            if (state.posts.isEmpty) {
              return const EmptyPostsWidget();
            }
            return CommunityListView(
              posts: state.posts,
              onLikeTap: cubit.togglePostLike,
              onRepeatTap: (post) =>
                  CommunityShareHelper.showShareSheet(context, post),
              onExportTap: (post) =>
                  CommunityShareHelper.copyPostLinkAndTrack(context, post),
            );
          case CommunityFeedStatus.failure:
            return CustomErrorWidget(
              message:
                  state.errorMessage ??
                  'An error occurred while loading posts.',
            );
        }
      },
    );
  }
}
