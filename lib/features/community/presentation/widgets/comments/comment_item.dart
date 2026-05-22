import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/datetime_extensions.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/widgets/user_avatar.dart';
import '../../../data/models/comment_model.dart';
import '../../manager/comments_cubit/comments_cubit.dart';

class CommentItem extends StatefulWidget {
  final CommentModel comment;
  final List<CommentModel> replies;
  final VoidCallback onReplyTap;
  final bool isReply;

  const CommentItem({
    super.key,
    required this.comment,
    this.replies = const [],
    required this.onReplyTap,
    this.isReply = false,
  });

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool _showReplies = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.isReply ? 40.0 : 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserAvatar(
                name: widget.comment.userName,
                imageUrl: widget.comment.userAvatar,
                radius: 16,
                fontSize: 14,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.bgFill,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '@${widget.comment.userName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.comment.content,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.bodyGray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.comment.createdAt.timeAgo(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.bodyGray,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            context.read<CommentsCubit>().toggleLike(
                              widget.comment.id,
                              widget.comment.isLikedByMe,
                              isReply: widget.isReply,
                              parentId: widget.comment.parentId,
                            );
                          },
                          child: Icon(
                            widget.comment.isLikedByMe
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 16,
                            color: widget.comment.isLikedByMe
                                ? Colors.red
                                : AppColors.bodyGray,
                          ),
                        ),
                        if (widget.comment.likesCount > 0) ...[
                          const SizedBox(width: 4),
                          Text(
                            '${widget.comment.likesCount}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.bodyGray,
                            ),
                          ),
                        ],
                        const SizedBox(width: 16),
                        if (!widget.isReply)
                          GestureDetector(
                            onTap: widget.onReplyTap,
                            child: const Text(
                              'Reply',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                      ],
                    ),
                    if (!widget.isReply && widget.comment.repliesCount > 0) ...[
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          if (!_showReplies) {
                            context.read<CommentsCubit>().loadReplies(
                              commentId: widget.comment.id,
                            );
                          }
                          setState(() {
                            _showReplies = !_showReplies;
                          });
                        },
                        child: Text(
                          _showReplies
                              ? 'Hide replies'
                              : 'View ${widget.comment.repliesCount} repl${widget.comment.repliesCount > 1 ? 'ies' : 'y'}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppColors.brandGreen,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
          if (_showReplies && widget.replies.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...widget.replies.map(
              (reply) => Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: CommentItem(
                  comment: reply,
                  isReply: true,
                  onReplyTap: widget.onReplyTap,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
