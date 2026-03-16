import 'package:flutter/material.dart';

class CustomCardTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  const CustomCardTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF9F9F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        validator:
            validator ??
            (value) {
              if (value == null || value.isEmpty) {
                return "Please enter $label";
              }
              return null;
            },
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
        ),
      ),
    );
  }
}
