import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/manager/network_cubit/network_cubit.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../community/data/repos/post_repo.dart';
import '../../../community/presentation/manager/community_feed_cubit/community_feed_cubit.dart';
import '../../../community/presentation/views/community_view.dart';

class CommunityProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const CommunityProvidersWrapper({super.key, required this.isPremium});
  void _retryRequests(BuildContext context) {
    context.read<CommunityFeedCubit>().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommunityFeedCubit(createPostRepo: getIt.get<PostRepo>())..getPosts(),
      child: BlocListener<NetworkCubit, NetworkState>(
        listener: (context, state) {
          if (state.status == NetworkStatus.reconnected) {
            _retryRequests(context);
          }
        },
        child: CommunityView(isPremium: isPremium),
      ),
    );
  }
}
