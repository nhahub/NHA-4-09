import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/widgets/custom_error_widget.dart';
import 'package:moodly/features/community/presentation/widgets/comments/comments_list_view.dart';
import '../../../data/models/dummy/dummy_comments.dart';
import '../../manager/comments_cubit/comments_cubit.dart';
import '../../manager/comments_cubit/comments_state.dart';
import 'no_comments_widget.dart';

class CommentsBlocBuilder extends StatelessWidget {
  const CommentsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CommentsCubit, CommentsState>(
        builder: (context, state) {
          switch (state.status) {
            case CommentsStatus.loading:
              return CommentsListView(
                comments: DummyComments.dummyComments,
                replies: const {},
                isLoading: true,
              );
            case CommentsStatus.success:
              if (state.comments!.isEmpty) {
                return const NoCommentsWidget();
              }
              return CommentsListView(
                comments: state.comments!,
                replies: state.replies!,
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
