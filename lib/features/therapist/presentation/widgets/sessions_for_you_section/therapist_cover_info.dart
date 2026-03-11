import 'package:flutter/material.dart';

import '../../../data/models/therapist_model.dart';
import 'discount_container.dart';
import 'rating_container.dart';

class TherapistCoverInfo extends StatelessWidget {
  const TherapistCoverInfo({super.key, required this.sessionsForYouModel});

  final TherapistModel sessionsForYouModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            sessionsForYouModel.image,
            fit: BoxFit.cover,
            height: 180.33,
            width: double.infinity,
          ),
        ),
        Positioned(
          top: 16,
          left: 16,
          child: RatingContainer(therapistModel: sessionsForYouModel),
        ),
        if (sessionsForYouModel.discount != 0)
          Positioned(
            bottom: 16,
            right: 16,
            child: DiscountContainer(sessionsForYouModel: sessionsForYouModel),
          ),
      ],
    );
  }
}
