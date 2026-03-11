import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/therapist_rating_cubit/therapist_rating_cubit.dart';

class AddTherapistRatingView extends StatefulWidget {
  final String therapistId;
  final String userId;

  const AddTherapistRatingView({
    super.key,
    required this.therapistId,
    required this.userId,
  });

  @override
  State<AddTherapistRatingView> createState() => _AddTherapistRatingViewState();
}

class _AddTherapistRatingViewState extends State<AddTherapistRatingView> {
  final TextEditingController reviewController = TextEditingController();

  int rating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Rating"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButton<int>(
              value: rating,
              items: List.generate(
                5,
                (index) => DropdownMenuItem(
                  value: index + 1,
                  child: Text("${index + 1} Stars"),
                ),
              ),
              onChanged: (v) {
                setState(() {
                  rating = v!;
                });
              },
            ),
            const SizedBox(height: 20),
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
                      userId: widget.userId,
                      rating: rating,
                      review: reviewController.text,
                    );

                Navigator.pop(context);
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}