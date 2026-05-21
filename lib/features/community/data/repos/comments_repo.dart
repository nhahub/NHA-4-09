import '../models/comment_model.dart';
import '../services/community_comments_remote_service.dart';
import '../services/community_posts_remote_service.dart';

class CommentsRepo {
  final CommunityCommentsRemoteService _remote;
  final CommunityPostsRemoteService _postsRemote;

  CommentsRepo({
    required CommunityCommentsRemoteService remote,
    required CommunityPostsRemoteService postsRemote,
  }) : _remote = remote,
       _postsRemote = postsRemote;

  Future<List<CommentModel>> fetchComments(String postId) {
    return _remote.fetchTopLevelComments(postId);
  }

  Future<List<CommentModel>> fetchReplies(String commentId) {
    return _remote.fetchReplies(commentId);
  }

  Future<CommentModel> addComment({
    required String postId,
    required String content,
    String? parentId,
    required int oldCommentsCount,
  }) async {
    final newComment = await _remote.addComment(
      postId: postId,
      content: content,
      parentId: parentId,
    );
    await _postsRemote.incrementCommentsCount(
      postId: postId,
      commentsCount: oldCommentsCount + 1,
    );
    return newComment;
  }

  Future<bool> toggleLike(String commentId, bool isCurrentlyLiked) async {
    try {
      return await _remote.toggleLike(
        commentId: commentId,
        isCurrentlyLiked: isCurrentlyLiked,
      );
    } catch (_) {
      return isCurrentlyLiked;
    }
  }
}
