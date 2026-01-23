import 'package:flutter/material.dart';

class RecommendationsView extends StatelessWidget {
  const RecommendationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
      body: const Center(child: Text('Welcome to the Recommendations View!')),
    );
  }
}
