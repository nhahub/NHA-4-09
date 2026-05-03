part of 'community_feed_cubit.dart';

enum CommunityFeedStatus { initial, loading, success, failure }

class CommunityFeedState extends Equatable {
  final CommunityFeedStatus status;
  final List<PostModel> posts;
  final String? errorMessage;

  const CommunityFeedState({
    this.status = CommunityFeedStatus.initial,
    this.posts = const [],
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, posts, errorMessage];

  CommunityFeedState copyWith({
    CommunityFeedStatus? status,
    List<PostModel>? posts,
    String? errorMessage,
  }) {
    return CommunityFeedState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: errorMessage,
    );
  }
}
