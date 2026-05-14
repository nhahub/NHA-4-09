import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/comment_model.dart';
import '../../../data/repos/comments_repo.dart';
import 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepo _repo;

  CommentsCubit({required CommentsRepo repo})
    : _repo = repo,
      super(const CommentsState(status: CommentsStatus.loading));

  Future<void> loadComments(String postId) async {
    emit(
      CommentsState(
        status: CommentsStatus.loading,
        comments: state.comments,
        replies: state.replies,
        errorMessage: null,
      ),
    );

    try {
      final comments = await _repo.fetchComments(postId);
      emit(
        CommentsState(
          status: CommentsStatus.success,
          comments: comments,
          replies: const {},
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        CommentsState(
          status: CommentsStatus.failure,
          comments: state.comments,
          replies: state.replies,
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> loadReplies(String commentId) async {
    try {
      final replies = await _repo.fetchReplies(commentId);
      final updatedReplies = Map<String, List<CommentModel>>.from(
        state.replies ?? const {},
      );
      updatedReplies[commentId] = replies;
      emit(
        state.copyWith(
          replies: updatedReplies,
          clearErrorMessage: true,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> addComment({
    required String postId,
    required String content,
    String? parentId,
  }) async {
    final snapshot = state;

    try {
      final newComment = await _repo.addComment(
        postId: postId,
        content: content,
        parentId: parentId,
      );

      if (parentId == null) {
        final existing = List<CommentModel>.from(snapshot.comments ?? []);
        emit(
          snapshot.copyWith(
            status: CommentsStatus.success,
            comments: [newComment, ...existing],
            clearErrorMessage: true,
          ),
        );
      } else {
        final updatedReplies = Map<String, List<CommentModel>>.from(
          snapshot.replies ?? const {},
        );
        final currentRepliesForParent = updatedReplies[parentId] ?? [];
        updatedReplies[parentId] = [...currentRepliesForParent, newComment];

        final updatedComments = (snapshot.comments ?? []).map((comment) {
          if (comment.id == parentId) {
            return comment.copyWith(repliesCount: comment.repliesCount + 1);
          }
          return comment;
        }).toList();

        emit(
          snapshot.copyWith(
            status: CommentsStatus.success,
            comments: updatedComments,
            replies: updatedReplies,
            clearErrorMessage: true,
          ),
        );
      }
    } catch (e) {
      emit(
        snapshot.copyWith(
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<void> toggleLike(
    String commentId,
    bool isCurrentlyLiked, {
    bool isReply = false,
    String? parentId,
  }) async {
    final optimisticState = _optimisticToggleLike(
      state,
      commentId,
      isCurrentlyLiked,
      isReply,
      parentId,
    );
    emit(optimisticState);

    try {
      final newStatus = await _repo.toggleLike(commentId, isCurrentlyLiked);
      if (newStatus == isCurrentlyLiked) {
        emit(
          _optimisticToggleLike(
            optimisticState,
            commentId,
            !isCurrentlyLiked,
            isReply,
            parentId,
          ),
        );
      }
    } catch (e) {
      emit(
        _optimisticToggleLike(
          optimisticState,
          commentId,
          !isCurrentlyLiked,
          isReply,
          parentId,
        ),
      );
    }
  }

  CommentsState _optimisticToggleLike(
    CommentsState current,
    String commentId,
    bool isCurrentlyLiked,
    bool isReply,
    String? parentId,
  ) {
    if (!isReply) {
      final list = current.comments ?? [];
      final updatedComments = list.map((comment) {
        if (comment.id == commentId) {
          return comment.copyWith(
            isLikedByMe: !isCurrentlyLiked,
            likesCount: isCurrentlyLiked
                ? comment.likesCount - 1
                : comment.likesCount + 1,
          );
        }
        return comment;
      }).toList();
      return current.copyWith(comments: updatedComments);
    }

    if (parentId == null) return current;
    final updatedRepliesMap = Map<String, List<CommentModel>>.from(
      current.replies ?? const {},
    );
    final parentReplies = updatedRepliesMap[parentId] ?? [];

    final updatedReplies = parentReplies.map((reply) {
      if (reply.id == commentId) {
        return reply.copyWith(
          isLikedByMe: !isCurrentlyLiked,
          likesCount: isCurrentlyLiked
              ? reply.likesCount - 1
              : reply.likesCount + 1,
        );
      }
      return reply;
    }).toList();

    updatedRepliesMap[parentId] = updatedReplies;
    return current.copyWith(replies: updatedRepliesMap);
  }
}
