import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../functions/user_data_local.dart';
import '../theming/app_assets.dart';
import '../theming/app_colors.dart';

class UserAvatar extends StatelessWidget {
  final String name;
  final String? imageUrl;
  final double? radius;
  final double? fontSize;
  final bool isAnonymous;
  const UserAvatar({
    super.key,
    required this.name,
    this.imageUrl,
    this.radius = 45,
    this.fontSize = 35,
    this.isAnonymous = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = radius! * 2;

    if (isAnonymous) {
      return CircleAvatar(
        backgroundColor: AppColors.getColorFromId(id: getUser()!.userId),
        radius: radius,
        child: SvgPicture.asset(
          AppAssets.anonymousIcon,
          width: radius!,
          height: radius!,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      );
    }

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.lightGrey,
        child: ClipOval(
          child: CachedNetworkImage(
            key: ValueKey(imageUrl),
            imageUrl: imageUrl!,
            cacheKey: imageUrl,
            width: size,
            height: size,
            fit: BoxFit.cover,
            placeholder: (context, url) => Skeletonizer(
              containersColor: Colors.grey.shade50,
              enabled: true,
              child: Container(
                width: size,
                height: size,
                color: Colors.grey.shade50,
              ),
            ),

            errorWidget: (context, url, error) => Container(
              width: size,
              height: size,
              color: AppColors.lightGrey,
              child: const Icon(Icons.person),
            ),
          ),
        ),
      );
    }

    final String initial = name.isNotEmpty ? name[0].toUpperCase() : "?";

    if (imageUrl == null || imageUrl!.isEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.getColorFromId(id: getUser()!.userId),
        child: Text(
          initial,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
