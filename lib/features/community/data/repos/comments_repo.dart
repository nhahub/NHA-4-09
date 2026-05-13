import '../models/comment_model.dart';
import '../services/community_comments_remote_service.dart';

/// Orchestrates community comments. Raw Supabase I/O lives in
/// [CommunityCommentsRemoteService].
class CommentsRepo {
  final CommunityCommentsRemoteService _remote;

  CommentsRepo({required CommunityCommentsRemoteService remote})
    : _remote = remote;

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
  }) {
    return _remote.insertComment(
      postId: postId,
      content: content,
      parentId: parentId,
    );
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
