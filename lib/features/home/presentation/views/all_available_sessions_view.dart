import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/widgets/vertical_padding_list.dart.dart';
import 'package:moodly/features/home/data/models/sessions_for_you_model.dart';
import 'package:moodly/features/home/presentation/widgets/sessions_for_you_section/sessions_for_you_card.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';

class AllAvailableSessionsView extends StatelessWidget {
  const AllAvailableSessionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: BackButtonAppbar(title: "All Sessions"),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: kAppHorizontalPadding,
                right: kAppVerticalPadding,
                bottom: 44,
              ),
              sliver: VerticalPaddingList(
                itemCount: sessionsForYouData.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 382,
                    child: SessionsForYouCard(
                      sessionsForYouModel: sessionsForYouData[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
