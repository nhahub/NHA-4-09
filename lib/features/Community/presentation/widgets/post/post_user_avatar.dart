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
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(postModel.userAvatar),
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
