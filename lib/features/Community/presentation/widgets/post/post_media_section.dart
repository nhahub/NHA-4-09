import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_styles.dart';

class PostMedia extends StatelessWidget {
  final List<String> images;

  const PostMedia({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.length == 1) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 1.6,
          child: Image.network(
            images.first,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 7),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: images.length > 2 ? 2 : images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        final isLast = index == 1 && images.length > 2;

        return ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(images[index], fit: BoxFit.cover),
              if (isLast)
                Container(
                  color: Colors.black.withAlpha(alphaFromPercentage(50)),
                  alignment: Alignment.center,
                  child: Text(
                    "+${images.length - 2}",
                    style: AppStyles.medium16,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
