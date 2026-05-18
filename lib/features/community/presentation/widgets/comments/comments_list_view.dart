import 'package:flutter/material.dart';
import '../../../data/models/comment_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'comment_item.dart';

class CommentsListView extends StatelessWidget {
  final bool isLoading;
  final List<CommentModel> comments;
  final Map<String, List<CommentModel>> replies;
  final void Function(String commentId, String userName) onReplyTap;

  const CommentsListView({
    super.key,
    required this.comments,
    required this.replies,
    required this.onReplyTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      containersColor: Colors.grey.shade50,
      enabled: isLoading,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: comments.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final comment = comments[index];
          final repliesByComment = replies[comment.id] ?? [];

          return CommentItem(
            comment: comment,
            replies: repliesByComment,
            onReplyTap: () => onReplyTap(comment.id, comment.userName),
          );
        },
      ),
    );
  }
}
