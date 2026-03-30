import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../../../core/widgets/shared/custom_card.dart';
import '../../../data/mock_data/your_daily_routine_data.dart';

class YourDailyRoutineListView extends StatelessWidget {
  final bool isLoading;
  const YourDailyRoutineListView({super.key, this.isLoading = false});
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
      height: 254,
      itemCount: yourDailyRoutineData.length,
      itemBuilder: (context, index) {
        return CustomCard(
          mediaEntity: yourDailyRoutineData[index],
          onTap: () {
            context.push(Routes.videoView);
          },
        );
      },
    );
  }
}
