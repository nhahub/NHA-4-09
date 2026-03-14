import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../functions/get_user.dart';
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
    if (imageUrl != null) {
      return CircleAvatar(
        backgroundColor: AppColors.lightGrey,
        radius: radius,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.fill,
            width: radius! * 2,
            height: radius! * 2,
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
      );
    }
    final String initial = name.isNotEmpty ? name[0].toUpperCase() : "?";

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
}
