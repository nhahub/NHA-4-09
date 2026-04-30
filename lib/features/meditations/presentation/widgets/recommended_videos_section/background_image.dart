import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String? imageUrl;

  const BackgroundImage({super.key, this.imageUrl});

  static const _fallbackColor = Color(0xFF2D4A6E);

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;

    if (url == null || url.isEmpty) {
      return Container(color: _fallbackColor);
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: _fallbackColor,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white54,
            strokeWidth: 2,
          ),
        ),
      ),

      errorWidget: (context, url, error) => Container(
        color: _fallbackColor,
        child: const Icon(Icons.image_not_supported, color: Colors.white54),
      ),
    );
  }
}
