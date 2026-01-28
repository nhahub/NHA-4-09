import 'package:flutter/material.dart';
import 'package:moodly/features/profile/presentation/helpers/logout_dialog.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeScrollable(
      fadePosition: FadePosition.bottom,
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              logoutDialog(context);
            },
            icon: const Icon(Icons.logout, color: Colors.red),
          ),
          const Center(child: Text('Welcome to the Profile View!')),
        ],
      ),
    );
  }
}
