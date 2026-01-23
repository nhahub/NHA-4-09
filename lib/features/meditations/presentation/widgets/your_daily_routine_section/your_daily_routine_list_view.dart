import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';

import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/mock_data/your_daily_routine_data.dart';

class YourDailyRoutineListView extends StatelessWidget {
  const YourDailyRoutineListView({super.key});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      height: 254,
      itemCount: yourDailyRoutineData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          meditationCardModel: yourDailyRoutineData[index],
          onTap: () {
            context.push(Routes.videoView);
          },
        );
      },
    );
  }
}
