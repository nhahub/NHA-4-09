import 'package:flutter/material.dart';

class ChatDoctorView extends StatelessWidget {
  const ChatDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Doctor')),
      body: const Center(child: Text('Welcome to the Chat Doctor View!')),
    );
  }
}
