import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_details/custom_rating.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_ratings/add_review_widget.dart';

class AddTherapistRatingView extends StatefulWidget {
  final String therapistId;

  const AddTherapistRatingView({super.key, required this.therapistId});

  @override
  State<AddTherapistRatingView> createState() => _AddTherapistRatingViewState();
}

class _AddTherapistRatingViewState extends State<AddTherapistRatingView> {
  int rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Add Rating"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          children: [
            const CustomRating(isEditable: true, userRating: 0),
            const SizedBox(height: 20),
            AddReviewWidget(rating: rating, therapistId: widget.therapistId),
          ],
        ),
      ),
    );
  }
}
