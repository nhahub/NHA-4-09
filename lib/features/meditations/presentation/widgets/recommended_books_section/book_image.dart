import 'package:flutter/material.dart';

import '../../../../../core/widgets/shared/adaptive_image.dart';

class BookImage extends StatelessWidget {
  final String imageUrl;
  const BookImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.4,
      child: AspectRatio(
        aspectRatio: 2 / 3,
        child: AdaptiveImage(
          imageUrl: imageUrl,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
