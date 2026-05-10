import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../manager/comments_cubit/comments_cubit.dart';

class CommentInputWidget extends StatefulWidget {
  final String postId;
  final String? replyingToCommentId;
  final String? replyingToUserName;
  final VoidCallback onCancelReply;
  final double bottomInset;

  const CommentInputWidget({
    super.key,
    required this.postId,
    this.replyingToCommentId,
    this.replyingToUserName,
    required this.onCancelReply,
    required this.bottomInset,
  });

  @override
  State<CommentInputWidget> createState() => _CommentInputWidgetState();
}

class _CommentInputWidgetState extends State<CommentInputWidget> {
  final TextEditingController _controller = TextEditingController();

  void _submit() {
    if (_controller.text.trim().isEmpty) return;

    context.read<CommentsCubit>().addComment(
      postId: widget.postId,
      content: _controller.text.trim(),
      parentId: widget.replyingToCommentId,
    );

    _controller.clear();
    widget.onCancelReply();
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: widget.bottomInset > 0 ? widget.bottomInset + 8 : 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.replyingToUserName != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 8),
              child: Row(
                children: [
                  Text(
                    'Replying to ${widget.replyingToUserName}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.bodyGray,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: widget.onCancelReply,
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: AppColors.bodyGray,
                    ),
                  ),
                ],
              ),
            ),
          Row(
            children: [
              // User avatar (Ideally fetched from the current user profile, but we can hardcode a placeholder for the input field or get it from auth service)
              const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150',
                ), // Placeholder for current user
                backgroundColor: AppColors.brandGreen,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    hintStyle: const TextStyle(
                      color: AppColors.bodyGray,
                      fontSize: 14,
                    ),
                    filled: true,
                    fillColor: AppColors.bgFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: _submit,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: AppColors.bgFill,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.send,
                    color: AppColors.brandGreen,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
