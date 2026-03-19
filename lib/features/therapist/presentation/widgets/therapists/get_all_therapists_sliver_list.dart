import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/vertical_padding_list.dart.dart';
import '../../../data/models/therapist_model.dart';
import '../../../../home/presentation/widgets/sessions_for_you_section/sessions_for_you_card.dart';

class GetAllTherapistsSliverList extends StatelessWidget {
  final List<TherapistModel> therapists;
  final bool isLoading;

  const GetAllTherapistsSliverList({
    super.key,
    required this.therapists,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalPaddingList(
      itemCount: therapists.length,
      itemBuilder: (context, index) {
        return Skeletonizer(
          enabled: isLoading,
          containersColor: Colors.grey[50],
          child: SizedBox(
            height: 382,
            child: SessionsForYouCard(
              therapistModel: therapists[index],
            ),
          ),
        );
      },
    );
  }
}