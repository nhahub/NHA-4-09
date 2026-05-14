import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import 'comment_input_widget.dart';
import 'comments_bloc_builder.dart';
import 'comments_sheet_header.dart';
import 'drag_handle.dart';

class CommentsBottomSheetView extends StatefulWidget {
  final String postId;

  const CommentsBottomSheetView({super.key, required this.postId});

  @override
  State<CommentsBottomSheetView> createState() =>
      _CommentsBottomSheetViewState();
}

class _CommentsBottomSheetViewState extends State<CommentsBottomSheetView> {
  String? replyingToCommentId;
  String? replyingToUserName;

  void _onReplyTap(String commentId, String userName) {
    setState(() {
      replyingToCommentId = commentId;
      replyingToUserName = userName;
    });
  }

  void _cancelReply() {
    setState(() {
      replyingToCommentId = null;
      replyingToUserName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          const DragHandle(),
          const CommentsSheetHeader(),
          const Divider(height: 1, color: AppColors.dividerColor),
          CommentsBlocBuilder(
            postId: widget.postId,
            onReplyTap: _onReplyTap,
          ),

          // Input Area
          CommentInputWidget(
            postId: widget.postId,
            replyingToCommentId: replyingToCommentId,
            replyingToUserName: replyingToUserName,
            onCancelReply: _cancelReply,
            bottomInset: bottomInset,
          ),
        ],
      ),
    );
  }
}

