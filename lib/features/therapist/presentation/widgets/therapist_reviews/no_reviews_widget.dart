import 'package:flutter/material.dart';

class NoReviewsWidget extends StatelessWidget {
  const NoReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.comment_bank_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          const Text(
            "No reviews yet",
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
