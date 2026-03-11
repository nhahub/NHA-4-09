import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_rating_cubit/therapist_rating_cubit.dart';
import '../../../../../core/extensions/context_extensions.dart';

class AddReviewWidget extends StatefulWidget {
  const AddReviewWidget({
    super.key,
    required this.rating,
    required this.therapistId,
  });

  final String therapistId;
  final int rating;

  @override
  State<AddReviewWidget> createState() => _AddReviewWidgetState();
}

class _AddReviewWidgetState extends State<AddReviewWidget> {
  final TextEditingController reviewController = TextEditingController();

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: reviewController,
          maxLines: 4,
          decoration: const InputDecoration(
            hintText: "Write your review...",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.read<TherapistRatingCubit>().addRating(
              therapistId: widget.therapistId,
              rating: widget.rating,
              review: reviewController.text,
            );
            context.pop();
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
