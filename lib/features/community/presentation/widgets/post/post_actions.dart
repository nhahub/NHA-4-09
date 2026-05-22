import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/community/presentation/manager/comments_cubit/comments_cubit.dart';
import 'package:moodly/features/community/presentation/manager/comments_cubit/comments_state.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/post_model.dart';
import '../comments/comments_bottom_sheet.dart';
import 'action_item.dart';

class PostActions extends StatefulWidget {
  final PostModel post;
  final VoidCallback? onLikeTap;
  final VoidCallback? onRepeatTap;
  final VoidCallback? onExportTap;

  const PostActions({
    super.key,
    required this.post,
    this.onLikeTap,
    this.onRepeatTap,
    this.onExportTap,
  });

  @override
  State<PostActions> createState() => _PostActionsState();
}

class _PostActionsState extends State<PostActions> {
  late final CommentsCubit cubit;

  @override
  void initState() {
    cubit = context.read<CommentsCubit>();
    cubit.loadComments(widget.post.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CommentsCubit, CommentsState>(
          builder: (context, state) {
            return ActionItem(
              iconSvg: AppAssets.chatCircleIcon,
              count: widget.post.commentsCount + state.commentsCount,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: BlocProvider.value(
                      value: cubit,
                      child: CommentsBottomSheet(post: widget.post),
                    ),
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(width: 24),
        ActionItem(
          iconSvg: AppAssets.repeatIcon,
          count: widget.post.sharesCount,
          onTap: () => widget.onRepeatTap?.call(),
        ),
        const SizedBox(width: 24),
        ActionItem(
          iconSvg: widget.post.isLikedByCurrentUser
              ? AppAssets.heartFillIcon
              : AppAssets.heartIcon,
          countColor: widget.post.isLikedByCurrentUser
              ? AppColors.lightRed
              : null,
          count: widget.post.loveCount,
          onTap: () {
            widget.onLikeTap?.call();
          },
        ),
      ],
    );
  }
}
