import 'package:flutter/material.dart';

import '../../../../core/enums/fade_position.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/fade_scrollable.dart';

class CommunityView extends StatelessWidget {
  final bool isPremium = true;
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: "Community",
        isPremium: isPremium,
        icon: AppAssets.searchIcon,
        onTap: () {},
      ),
      // ignore: prefer_const_constructors
      body: FadeScrollable(
        fadePosition: FadePosition.bottom,
        child: const Column(
          children: [
            SizedBox(height: 80),
            Center(child: Text('Welcome to the Community View!')),
          ],
        ),
      ),
    );
  }
}
