import 'package:flutter/material.dart';

class AudioView extends StatelessWidget {
  const AudioView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Audio')),
      body: const Center(child: Text('Welcome to the Audio View!')),
    );
  }
}
