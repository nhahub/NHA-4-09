import 'package:flutter/material.dart';

import '../../../community/presentation/views/community_view.dart';

class CommunityProvidersWrapper extends StatelessWidget {
  final bool isPremium;
  const CommunityProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return CommunityView(isPremium: isPremium);
  }
}
