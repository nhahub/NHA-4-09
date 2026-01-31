import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/mock_data/meditations_for_you_data.dart';

class MeditationsForYouListView extends StatelessWidget {
  const MeditationsForYouListView({super.key});

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: meditationsForYouData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          mediaEntity: meditationsForYouData[index],

          onTap: () {
            context.push(Routes.videoView);
          },
        );
      },
    );
  }
}
