import 'package:flutter/material.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/core/widgets/user_avatar.dart';

import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../helpers/logout_dialog.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeScrollable(
      fadePosition: FadePosition.bottom,
      child: Column(
        children: [
          UserAvatar(
            name: getUser()?.name ?? '',
            radius: 32,
            fontSize: 30,
            imageUrl: getUser()?.image,
          ),
          IconButton(
            onPressed: () {
              logoutDialog(context);
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
          const Center(child: Text('Welcome to the Settings View!')),
        ],
      ),
    );
  }
}
