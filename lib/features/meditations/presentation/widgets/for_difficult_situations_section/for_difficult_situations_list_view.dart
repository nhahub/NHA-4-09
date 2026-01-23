import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';

import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/mock_data/for_difficult_situations_data.dart';

class ForDifficultSituationsListView extends StatelessWidget {
  const ForDifficultSituationsListView({super.key});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: forDifficultSituationsData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          meditationCardModel: forDifficultSituationsData[index],
          onTap: () {
            context.push(Routes.audioView);
          },
        );
      },
    );
  }
}
