import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'comments_list_view.dart';

import '../../../data/models/comment_model.dart';
import '../../manager/comments_cubit/comments_cubit.dart';
import '../../manager/comments_cubit/comments_state.dart';
import 'no_comments_widget.dart';

List<CommentModel> _skeletonComments(String postId) {
  final now = DateTime.now();
  return List<CommentModel>.generate(
    4,
    (i) => CommentModel(
      id: '__sk__$i',
      postId: postId,
      userId: '',
      content: ' ',
      createdAt: now,
      userName: ' ',
      userAvatar: '',
    ),
  );
}

class CommentsBlocBuilder extends StatelessWidget {
  final void Function(String commentId, String userName) onReplyTap;
  final String postId;

  const CommentsBlocBuilder({
    super.key,
    required this.onReplyTap,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          switch (state.status) {
            case CommentsStatus.loading:
              return CommentsListView(
                comments: _skeletonComments(postId),
                replies: const {},
                isLoading: true,
                onReplyTap: onReplyTap,
              );
            case CommentsStatus.success:
              if (state.comments!.isEmpty) {
                return const NoCommentsWidget();
              }
              return CommentsListView(
                comments: state.comments!,
                replies: state.replies!,
                isLoading: false,
                onReplyTap: onReplyTap,
              );
            case CommentsStatus.failure:
              return CustomErrorWidget(
                message:
                    state.errorMessage ??
                    'An error occurred while loading comments.',
              );
          }
        },
      ),
    );
  }
}
