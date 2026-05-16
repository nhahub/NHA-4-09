import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_keys.dart';
import '../../../../core/services/get_it_service.dart';
import '../../data/models/post_model.dart';
import '../../data/repos/create_post_repo.dart';

class CommunityShareHelper {
  CommunityShareHelper._();

  static String postDeepLink(String postId) {
    final base = ApiKeys.communityPostShareBase?.trim();
    if (base != null && base.isNotEmpty) {
      return '$base/community/post/$postId';
    }
    return 'moodly://community/post/$postId';
  }

  static Future<void> showShareSheet(
    BuildContext context,
    PostModel post,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.link),
              title: const Text('Copy link'),
              onTap: () async {
                Navigator.pop(ctx);
                await copyPostLink(post.id);
                await getIt<CreatePostRepo>().recordShare(post.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.chat),
              title: const Text('WhatsApp'),
              onTap: () async {
                Navigator.pop(ctx);
                final text = '${post.content.trim()}\n${postDeepLink(post.id)}';
                final url = Uri.parse(
                  'https://wa.me/?text=${Uri.encodeComponent(text)}',
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                }
                await getIt<CreatePostRepo>().recordShare(post.id);
              },
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () async {
                Navigator.pop(ctx);
                await SharePlus.instance.share(
                  ShareParams(
                    text: '${post.content.trim()}\n${postDeepLink(post.id)}',
                  ),
                );
                await getIt<CreatePostRepo>().recordShare(post.id);
              },
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> copyPostLink(String postId) async {
    await Clipboard.setData(ClipboardData(text: postDeepLink(postId)));
  }

  static Future<void> copyPostLinkAndTrack(
    BuildContext context,
    PostModel post,
  ) async {
    await copyPostLink(post.id);
    await getIt<CreatePostRepo>().recordShare(post.id);
  }
}
