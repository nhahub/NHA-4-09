import 'package:equatable/equatable.dart';
import '../../../data/models/comment_model.dart';

enum CommentsStatus { loading, success, failure }

extension CommentsStatusX on CommentsStatus {
  bool get isLoading => this == CommentsStatus.loading;
  bool get isSuccess => this == CommentsStatus.success;
  bool get isFailure => this == CommentsStatus.failure;
}

class CommentsState extends Equatable {
  final CommentsStatus status;
  final List<CommentModel>? comments;
  final Map<String, List<CommentModel>>? replies;
  final String? errorMessage;

  const CommentsState({
    this.status = CommentsStatus.loading,
    this.comments,
    this.replies,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, comments, replies, errorMessage];

  CommentsState copyWith({
    CommentsStatus? status,
    List<CommentModel>? comments,
    Map<String, List<CommentModel>>? replies,
    String? errorMessage,
    bool clearErrorMessage = false,
  }) {
    return CommentsState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      replies: replies ?? this.replies,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}
