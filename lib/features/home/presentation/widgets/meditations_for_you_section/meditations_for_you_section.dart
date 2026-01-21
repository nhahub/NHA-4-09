import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import 'meditations_for_you_header.dart';
import 'meditations_for_you_list_view.dart';

class MeditationsForYouSection extends StatelessWidget {
  const MeditationsForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MeditationsForYouHeader(),
        const SizedBox(height: kAppSectionSpacing),
        MeditationsForYouListView(),
      ],
    );
  }
}
