import 'package:flutter/material.dart';
import 'package:moodly/core/widgets/vertical_padding_list.dart.dart';
import 'package:moodly/features/home/data/mock_data/meditations_for_you_data.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/shared/custom_card.dart';

class AllMeditationsView extends StatelessWidget {
  const AllMeditationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: BackButtonAppbar(title: "All Meditations"),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: kAppHorizontalPadding,
                right: kAppVerticalPadding,
                bottom: 44,
              ),
              sliver: VerticalPaddingList(
                itemCount: meditationsForYouData.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 254,
                    child: CustomCard(
                      meditationCardModel: meditationsForYouData[index],
                      onTap: () {
                        context.push(Routes.videoView);
                      },
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
