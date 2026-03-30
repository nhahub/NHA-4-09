import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/post_model.dart';

class PostUserAvatar extends StatelessWidget {
  const PostUserAvatar({super.key, required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipOval(
          child: CachedNetworkImage(
            imageUrl: postModel.userAvatar,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            // While the image is loading, show a placeholder
            placeholder: (context, url) => Container(
              width: 40,
              height: 40,
              color: Colors.grey.shade300,
              child: const Icon(Icons.person, size: 18, color: Colors.white),
            ),
            errorWidget: (context, url, error) => Container(
              width: 40,
              height: 40,
              color: Colors.grey,
              child: const Icon(Icons.person),
            ),
          ),
        ),
        if (postModel.isPremium)
          Positioned(
            bottom: -2,
            right: -2,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(1.5),
              child: const Icon(
                Icons.check_circle,
                size: 14,
                color: Color(0xFF32B453),
              ),
            ),
          ),
      ],
    );
  }
}
