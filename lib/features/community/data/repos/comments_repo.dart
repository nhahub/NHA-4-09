import '../models/comment_model.dart';
import '../services/community_comments_remote_service.dart';

/// Orchestrates community comments (mock vs remote). Raw Supabase I/O lives in
/// [CommunityCommentsRemoteService].
class CommentsRepo {
  final CommunityCommentsRemoteService _remote;

  /// Set to false when Supabase tables are ready for production comments.
  static const bool useMockData = true;

  static final List<CommentModel> _mockComments = [
    CommentModel(
      id: 'mock_1',
      postId: '0',
      userId: 'mock_user_1',
      content:
          'This is so inspiring! I\'ve been working on my mindfulness practice too. How long did it take you to build this habit?',
      createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
      likesCount: 24,
      repliesCount: 1,
      isLikedByMe: true,
      userName: 'nataleah',
      userAvatar: 'https://i.pravatar.cc/150?img=47',
    ),
    CommentModel(
      id: 'mock_reply_1',
      postId: '0',
      userId: 'mock_user_2',
      parentId: 'mock_1',
      content: 'It took me about 3 weeks to make it a daily routine!',
      createdAt: DateTime.now().subtract(const Duration(minutes: 1)),
      likesCount: 5,
      repliesCount: 0,
      isLikedByMe: false,
      userName: 'helen.vui.author',
      userAvatar: 'https://i.pravatar.cc/150?img=32',
    ),
    CommentModel(
      id: 'mock_2',
      postId: '0',
      userId: 'mock_user_3',
      content: 'Love this! Keep up the great work 💚',
      createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
      likesCount: 12,
      repliesCount: 0,
      isLikedByMe: false,
      userName: 'boredpleo',
      userAvatar: 'https://i.pravatar.cc/150?img=11',
    ),
    CommentModel(
      id: 'mock_3',
      postId: '1',
      userId: 'mock_user_4',
      content: 'This post is amazing! I really needed to hear this today.',
      createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
      likesCount: 3,
      repliesCount: 0,
      isLikedByMe: true,
      userName: 'john_doe',
      userAvatar: 'https://i.pravatar.cc/150?img=50',
    ),
  ];

  CommentsRepo({required CommunityCommentsRemoteService remote})
    : _remote = remote;

  Future<List<CommentModel>> fetchComments(String postId) async {
    if (useMockData) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final topLevelComments = _mockComments
          .where((c) => c.parentId == null && c.postId == postId)
          .toList();
      topLevelComments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return topLevelComments;
    }

    return _remote.fetchTopLevelComments(postId);
  }

  Future<List<CommentModel>> fetchReplies(String commentId) async {
    if (useMockData) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final replies = _mockComments
          .where((c) => c.parentId == commentId)
          .toList();
      replies.sort((a, b) => a.createdAt.compareTo(b.createdAt));
      return replies;
    }

    return _remote.fetchReplies(commentId);
  }

  Future<CommentModel> addComment({
    required String postId,
    required String content,
    String? parentId,
  }) async {
    if (useMockData) {
      await Future<void>.delayed(const Duration(milliseconds: 500));
      final newComment = CommentModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        postId: postId,
        userId: 'current_user',
        parentId: parentId,
        content: content,
        createdAt: DateTime.now(),
        likesCount: 0,
        repliesCount: 0,
        isLikedByMe: false,
        userName: 'You',
        userAvatar: 'https://i.pravatar.cc/150?img=68',
      );
      _mockComments.add(newComment);
      if (parentId != null) {
        final parentIndex = _mockComments.indexWhere((c) => c.id == parentId);
        if (parentIndex != -1) {
          final parent = _mockComments[parentIndex];
          _mockComments[parentIndex] = parent.copyWith(
            repliesCount: parent.repliesCount + 1,
          );
        }
      }
      return newComment;
    }

    return _remote.insertComment(
      postId: postId,
      content: content,
      parentId: parentId,
    );
  }

  Future<bool> toggleLike(String commentId, bool isCurrentlyLiked) async {
    if (useMockData) {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      final index = _mockComments.indexWhere((c) => c.id == commentId);
      if (index != -1) {
        final comment = _mockComments[index];
        _mockComments[index] = comment.copyWith(
          isLikedByMe: !isCurrentlyLiked,
          likesCount: isCurrentlyLiked
              ? comment.likesCount - 1
              : comment.likesCount + 1,
        );
      }
      return !isCurrentlyLiked;
    }

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
