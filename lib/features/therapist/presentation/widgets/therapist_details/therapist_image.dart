import 'package:flutter/material.dart';
import 'package:moodly/features/home/data/models/therapist_model.dart';
import 'package:moodly/features/home/presentation/widgets/sessions_for_you_section/discount_container.dart';

class TherapistImage extends StatelessWidget {
  final TherapistModel therapistModel;

  const TherapistImage({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
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
