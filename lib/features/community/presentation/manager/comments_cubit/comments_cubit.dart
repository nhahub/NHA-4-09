import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/comment_model.dart';
import '../../../data/repositories/comments_repository.dart';
import 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepository _repository;

  CommentsCubit({required CommentsRepository repository})
      : _repository = repository,
        super(CommentsInitial());

  Future<void> loadComments(String postId) async {
    emit(CommentsLoading());
    try {
      final comments = await _repository.fetchComments(postId);
      emit(CommentsLoaded(comments: comments, replies: const {}));
    } catch (e) {
      emit(CommentsError(e.toString()));
    }
  }

  Future<void> loadReplies(String commentId) async {
    final currentState = state;
    if (currentState is! CommentsLoaded) return;

    try {
      final replies = await _repository.fetchReplies(commentId);
      final updatedReplies = Map<String, List<CommentModel>>.from(currentState.replies);
      updatedReplies[commentId] = replies;
      emit(currentState.copyWith(replies: updatedReplies));
    } catch (e) {
      // Could emit an error or just ignore it depending on UX needs.
      // Ignoring failure to load replies to not break the whole list.
    }
  }

  Future<void> addComment({
    required String postId,
    required String content,
    String? parentId,
  }) async {
    final currentState = state;
    if (currentState is! CommentsLoaded) return;

    try {
      final newComment = await _repository.addComment(
        postId: postId,
        content: content,
        parentId: parentId,
      );

      if (parentId == null) {
        // It's a top-level comment
        final updatedComments = List<CommentModel>.from(currentState.comments)
          ..insert(0, newComment);
        emit(currentState.copyWith(comments: updatedComments));
      } else {
        // It's a reply
        final updatedReplies = Map<String, List<CommentModel>>.from(currentState.replies);
        final currentRepliesForParent = updatedReplies[parentId] ?? [];
        updatedReplies[parentId] = [...currentRepliesForParent, newComment];

        // Also update the repliesCount of the parent comment
        final updatedComments = currentState.comments.map((comment) {
          if (comment.id == parentId) {
            return comment.copyWith(repliesCount: comment.repliesCount + 1);
          }
          return comment;
        }).toList();

        emit(currentState.copyWith(
          comments: updatedComments,
          replies: updatedReplies,
        ));
      }
    } catch (e) {
      // Error handling, maybe show a toast in UI
    }
  }

  Future<void> toggleLike(String commentId, bool isCurrentlyLiked, {bool isReply = false, String? parentId}) async {
    final currentState = state;
    if (currentState is! CommentsLoaded) return;

    // Optimistic update
    CommentsLoaded nextState = _optimisticToggleLike(currentState, commentId, isCurrentlyLiked, isReply, parentId);
    emit(nextState);

    try {
      final newStatus = await _repository.toggleLike(commentId, isCurrentlyLiked);
      if (newStatus == isCurrentlyLiked) {
        // Revert if API failed and returned the old status
        emit(_optimisticToggleLike(currentState, commentId, !isCurrentlyLiked, isReply, parentId));
      }
    } catch (e) {
      // Revert on error
      emit(_optimisticToggleLike(currentState, commentId, !isCurrentlyLiked, isReply, parentId));
    }
  }

  CommentsLoaded _optimisticToggleLike(CommentsLoaded state, String commentId, bool isCurrentlyLiked, bool isReply, String? parentId) {
    if (!isReply) {
      final updatedComments = state.comments.map((comment) {
        if (comment.id == commentId) {
          return comment.copyWith(
            isLikedByMe: !isCurrentlyLiked,
            likesCount: isCurrentlyLiked ? comment.likesCount - 1 : comment.likesCount + 1,
          );
        }
        return comment;
      }).toList();
      return state.copyWith(comments: updatedComments);
    } else {
      if (parentId == null) return state;
      final updatedRepliesMap = Map<String, List<CommentModel>>.from(state.replies);
      final parentReplies = updatedRepliesMap[parentId] ?? [];
      
      final updatedReplies = parentReplies.map((reply) {
        if (reply.id == commentId) {
          return reply.copyWith(
            isLikedByMe: !isCurrentlyLiked,
            likesCount: isCurrentlyLiked ? reply.likesCount - 1 : reply.likesCount + 1,
          );
        }
        return reply;
      }).toList();

      updatedRepliesMap[parentId] = updatedReplies;
      return state.copyWith(replies: updatedRepliesMap);
    }
  }
}
