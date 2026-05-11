import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../data/repositories/comments_repository.dart';
import '../../manager/comments_cubit/comments_cubit.dart';
import 'comments_bottom_sheet_view.dart';

class CommentsBottomSheet extends StatelessWidget {
  final String postId;

  const CommentsBottomSheet({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CommentsCubit(repository: getIt<CommentsRepository>())
            ..loadComments(postId),
      child: CommentsBottomSheetView(postId: postId),
    );
  }
}
