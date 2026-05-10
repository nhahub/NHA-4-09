import 'package:flutter/material.dart';

import '../../../data/models/post_model.dart';
import 'post_actions.dart';
import 'post_content.dart';
import 'post_header.dart';
import 'post_media_section.dart';
import 'post_user_avatar.dart';

class PostCard extends StatelessWidget {
  final PostModel postModel;
  final VoidCallback? onLikeTap;

  const PostCard({super.key, required this.postModel, this.onLikeTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Avatar
        PostUserAvatar(postModel: postModel),
        const SizedBox(width: 16),
        // Content Column
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
              PostActions(post: postModel, onLikeTap: onLikeTap),
            ],
          ),
        ),
      ],
    );
  }
}
