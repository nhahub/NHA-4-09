import 'package:flutter/material.dart';

class LiveView extends StatelessWidget {
  const LiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live View')),
      body: const Center(child: Text('Welcome to the Live View!')),
    );
  }
}
