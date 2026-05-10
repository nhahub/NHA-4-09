part of 'community_feed_cubit.dart';

enum CommunityFeedStatus { loading, success, failure }

extension CommunityFeedStatusX on CommunityFeedStatus {
  bool get isLoading => this == CommunityFeedStatus.loading;
  bool get isSuccess => this == CommunityFeedStatus.success;
  bool get isFailure => this == CommunityFeedStatus.failure;
}

class CommunityFeedState extends Equatable {
  final CommunityFeedStatus status;
  final List<PostModel> posts;
  final String? errorMessage;

  const CommunityFeedState({
    this.status = CommunityFeedStatus.loading,
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
