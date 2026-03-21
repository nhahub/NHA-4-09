import 'package:flutter/material.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';

class RecommendationsView extends StatelessWidget {
  const RecommendationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "Recommendations"),
      body: Center(child: Text('Welcome to the Recommendations View!')),
    );
  }
}
