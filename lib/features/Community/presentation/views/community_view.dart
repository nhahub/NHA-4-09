import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../widgets/add_community_post_button.dart';
import '../widgets/community_view_body.dart';

class CommunityView extends StatelessWidget {
  final bool isPremium = kIsPremium;
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddCommunityPostButton(),
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: "Community",
        isPremium: isPremium,
        icon: AppAssets.searchIcon,
        onTap: () {},
      ),
      body: const FadeScrollable(
        fadePosition: FadePosition.bottom,
        child: CommunityViewBody(),
      ),
    );
  }
}
