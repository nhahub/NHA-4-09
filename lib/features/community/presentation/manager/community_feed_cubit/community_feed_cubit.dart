import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repos/create_post_repo.dart';

part 'community_feed_state.dart';

class CommunityFeedCubit extends Cubit<CommunityFeedState> {
  final CreatePostRepo _repo;

  CommunityFeedCubit({required CreatePostRepo createPostRepo})
    : _repo = createPostRepo,
      super(const CommunityFeedState(status: CommunityFeedStatus.loading));

  Future<void> getPosts() async {
    try {
      final posts = await _repo.getPosts();
      emit(
        CommunityFeedState(
          status: CommunityFeedStatus.success,
          posts: posts,
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: CommunityFeedStatus.failure,
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
