import 'package:flutter/material.dart';

import '../../../../home/presentation/widgets/sessions_for_you_section/discount_container.dart';
import '../../../data/models/therapist_model.dart';

class TherapistImage extends StatelessWidget {
  final TherapistModel therapistModel;

  const TherapistImage({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            therapistModel.image,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
        if (therapistModel.discount != 0)
          Positioned(
            bottom: 16,
            right: 16,
            child: DiscountContainer(sessionsForYouModel: therapistModel),
          ),
      ],
    );
  }
}
