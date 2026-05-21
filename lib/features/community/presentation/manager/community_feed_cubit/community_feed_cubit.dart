import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repos/post_repo.dart';

part 'community_feed_state.dart';

class CommunityFeedCubit extends Cubit<CommunityFeedState> {
  final PostRepo _repo;

  RealtimeChannel? _feedChannel;
  Timer? _realtimeDebounce;
  StreamSubscription<List<PostModel>>? _postsSubscription;

  CommunityFeedCubit({required PostRepo createPostRepo})
    : _repo = createPostRepo,
      super(const CommunityFeedState(status: CommunityFeedStatus.loading)) {
    _attachRealtime();
  }

  void _attachRealtime() {
    _feedChannel = _repo.subscribeCommunityFeed(_onCommunityTablesChanged);
  }

  void _onCommunityTablesChanged() {
    _realtimeDebounce?.cancel();
    _realtimeDebounce = Timer(const Duration(milliseconds: 400), () {
      getPosts();
    });
  }

  Future<void> getPosts() async {
    emit(state.copyWith(status: CommunityFeedStatus.loading));

    await _postsSubscription?.cancel();

    _postsSubscription = _repo.getPosts().listen(
      (posts) {
        emit(
          state.copyWith(
            status: CommunityFeedStatus.success,
            posts: posts,
            errorMessage: null,
          ),
        );
      },
      onError: (e) {
        emit(
          state.copyWith(
            status: CommunityFeedStatus.failure,
            errorMessage: ApiErrorHandler.handle(error: e).message,
          ),
        );
      },
    );
  }

  Future<void> togglePostLike(PostModel post) async {
    if (state.status != CommunityFeedStatus.success) return;

    final previousPosts = List<PostModel>.from(state.posts);
    final optimistic = post.copyWith(
      isLikedByCurrentUser: !post.isLikedByCurrentUser,
      loveCount: post.isLikedByCurrentUser
          ? post.loveCount - 1
          : post.loveCount + 1,
    );

    emit(
      state.copyWith(
        posts: previousPosts
            .map((p) => p.id == post.id ? optimistic : p)
            .toList(),
      ),
    );

    try {
      await _repo.togglePostLike(
        postId: post.id,
        isCurrentlyLiked: post.isLikedByCurrentUser,
      );
    } catch (e) {
      emit(
        state.copyWith(
          posts: previousPosts,
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _realtimeDebounce?.cancel();
    final ch = _feedChannel;
    if (ch != null) {
      _repo.unsubscribeCommunityFeed(ch);
    }
    _postsSubscription?.cancel();
    return super.close();
  }
}
