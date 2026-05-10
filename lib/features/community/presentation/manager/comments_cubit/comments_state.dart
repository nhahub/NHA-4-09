import 'package:equatable/equatable.dart';
import '../../../data/models/comment_model.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object?> get props => [];
}

class CommentsInitial extends CommentsState {}

class CommentsLoading extends CommentsState {}

class CommentsLoaded extends CommentsState {
  final List<CommentModel> comments;
  final Map<String, List<CommentModel>> replies; // Key: parent comment ID

  const CommentsLoaded({
    required this.comments,
    required this.replies,
  });

  CommentsLoaded copyWith({
    List<CommentModel>? comments,
    Map<String, List<CommentModel>>? replies,
  }) {
    return CommentsLoaded(
      comments: comments ?? this.comments,
      replies: replies ?? this.replies,
    );
  }

  @override
  List<Object?> get props => [comments, replies];
}

class CommentsError extends CommentsState {
  final String message;

  const CommentsError(this.message);

  @override
  List<Object?> get props => [message];
}
