import 'package:flutter/material.dart';

import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../widgets/post/add_community_post_button.dart';
import '../widgets/post/community_bloc_builder.dart';

class CommunityView extends StatelessWidget {
  final bool isPremium;
  const CommunityView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: AddCommunityPostButton(),
      body: FadeScrollable(
        fadePosition: FadePosition.bottom,
        child: CommunityBlocBuilder(),
      ),
    );
  }
}
