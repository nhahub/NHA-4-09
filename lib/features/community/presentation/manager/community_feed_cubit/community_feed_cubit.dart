import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post_model.dart';
import '../../../data/repos/create_post_repo.dart';

part 'community_feed_state.dart';

class CommunityFeedCubit extends Cubit<CommunityFeedState> {
  final CreatePostRepo _repo;

  CommunityFeedCubit({required CreatePostRepo createPostRepo})
    : _repo = createPostRepo,
      super(const CommunityFeedState());

  Future<void> getPosts() async {
    emit(state.copyWith(status: CommunityFeedStatus.loading, errorMessage: null));
    try {
      final posts = await _repo.getPosts();
      emit(state.copyWith(status: CommunityFeedStatus.success, posts: posts));
    } catch (e) {
      emit(
        state.copyWith(
          status: CommunityFeedStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
