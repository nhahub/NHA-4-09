import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/post_model.dart';

class PostUserAvatar extends StatelessWidget {
  const PostUserAvatar({super.key, required this.postModel});

  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: postModel.userImage,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
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
    );
  }
}
