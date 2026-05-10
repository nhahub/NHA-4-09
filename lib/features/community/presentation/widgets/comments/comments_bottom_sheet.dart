import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/repositories/comments_repository.dart';
import '../../manager/comments_cubit/comments_cubit.dart';
import '../../manager/comments_cubit/comments_state.dart';
import 'comment_input_widget.dart';
import 'comment_item.dart';

class CommentsBottomSheet extends StatelessWidget {
  final String postId;

  const CommentsBottomSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsCubit(
        repository: getIt<CommentsRepository>(),
      )..loadComments(postId),
      child: CommentsBottomSheetView(postId: postId),
    );
  }
}

class CommentsBottomSheetView extends StatefulWidget {
  final String postId;
  
  const CommentsBottomSheetView({super.key, required this.postId});

  @override
  State<CommentsBottomSheetView> createState() => _CommentsBottomSheetViewState();
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
      // Set height based on screen size, allowing it to be scrollable
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          // Drag handle
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<CommentsCubit, CommentsState>(
                  builder: (context, state) {
                    int count = 0;
                    if (state is CommentsLoaded) {
                      count = state.comments.length;
                      for (var replies in state.replies.values) {
                        count += replies.length;
                      }
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Comments',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '$count comments',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.bodyGray,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1, color: AppColors.dividerColor),
          
          // Comments List
          Expanded(
            child: BlocBuilder<CommentsCubit, CommentsState>(
              builder: (context, state) {
                if (state is CommentsLoading || state is CommentsInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CommentsError) {
                  return Center(child: Text(state.message));
                } else if (state is CommentsLoaded) {
                  if (state.comments.isEmpty) {
                    return const Center(
                      child: Text(
                        'No comments yet. Be the first to comment!',
                        style: TextStyle(color: AppColors.bodyGray),
                      ),
                    );
                  }
                  
                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    itemCount: state.comments.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final comment = state.comments[index];
                      final replies = state.replies[comment.id] ?? [];
                      
                      return CommentItem(
                        comment: comment,
                        replies: replies,
                        onReplyTap: () => _onReplyTap(comment.id, comment.userName),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
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
