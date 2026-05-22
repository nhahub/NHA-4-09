import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/widgets/user_avatar.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repos/comments_repo.dart';
import '../../manager/comments_cubit/comments_cubit.dart';
import 'post_actions.dart';
import 'post_content.dart';
import 'post_header.dart';
import 'post_media_section.dart';

class PostCard extends StatelessWidget {
  final PostModel postModel;
  final VoidCallback? onLikeTap;
  final VoidCallback? onRepeatTap;
  final VoidCallback? onExportTap;

  const PostCard({
    super.key,
    required this.postModel,
    this.onLikeTap,
    this.onRepeatTap,
    this.onExportTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserAvatar(
          name: postModel.userName ?? 'User',
          imageUrl: postModel.userAvatar,
          radius: 20,
          fontSize: 18,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostHeader(postModel: postModel),
              const SizedBox(height: 4),
              PostContent(content: postModel.content),
              if (postModel.imageUrls.isNotEmpty) ...[
                const SizedBox(height: 8),
                PostMedia(images: postModel.imageUrls),
              ],
              const SizedBox(height: 8),
              BlocProvider(
                create: (_) => CommentsCubit(repo: getIt<CommentsRepo>()),
                child: PostActions(
                  post: postModel,
                  onLikeTap: onLikeTap,
                  onRepeatTap: onRepeatTap,
                  onExportTap: onExportTap,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
