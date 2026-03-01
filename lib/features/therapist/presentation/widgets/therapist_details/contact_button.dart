import 'package:flutter/material.dart';

class ContactButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  const ContactButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      icon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Icon(icon, size: 22, color: Colors.white),
      ),
    );
  }
}
