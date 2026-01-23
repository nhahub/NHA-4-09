import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';

/// ================= Grid Painter =================
class GridPainter extends CustomPainter {
  final double maxY;
  const GridPainter({required this.maxY});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.borderButton.withAlpha(15)
      ..strokeWidth = 1;

    final step = size.height / maxY;
    for (int i = -1; i < maxY; i++) {
      final y = size.height - (i * step);
      canvas.drawLine(Offset(0, y - 6), Offset(size.width, y - 6), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
