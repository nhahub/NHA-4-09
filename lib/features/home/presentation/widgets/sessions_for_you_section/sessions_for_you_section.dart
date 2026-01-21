import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import 'sessions_for_you_header.dart';
import 'sessions_for_you_list_view.dart';

class SessionsForYouSection extends StatelessWidget {
  const SessionsForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SessionsForYouHeader(),
        const SizedBox(height: kAppSectionSpacing),
        SessionsForYouListView(),
      ],
    );
  }
}
