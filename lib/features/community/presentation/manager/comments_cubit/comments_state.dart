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
  final int commentsCount;
  final Map<String, List<CommentModel>>? replies;
  final String? errorMessage;

  const CommentsState({
    this.status = CommentsStatus.loading,
    this.comments,
    this.commentsCount = 0,
    this.replies,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    status,
    comments,
    replies,
    errorMessage,
    commentsCount,
  ];

  CommentsState copyWith({
    CommentsStatus? status,
    List<CommentModel>? comments,
    Map<String, List<CommentModel>>? replies,
    String? errorMessage,
    bool clearErrorMessage = false,
    int? commentsCount,
  }) {
    return CommentsState(
      status: status ?? this.status,
      comments: comments ?? this.comments,
      replies: replies ?? this.replies,
      commentsCount: commentsCount ?? this.commentsCount,
      errorMessage: clearErrorMessage
          ? null
          : (errorMessage ?? this.errorMessage),
    );
  }
}
