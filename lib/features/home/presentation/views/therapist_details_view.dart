import 'package:flutter/material.dart';

class TherapistDetailsView extends StatelessWidget {
  const TherapistDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Therapist Details')),
      body: const Center(child: Text('Welcome to the Therapist Details View!')),
    );
  }
}
