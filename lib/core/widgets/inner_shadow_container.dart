import 'package:flutter/material.dart';

class InnerShadowBox extends StatelessWidget {
  final double width;
  final double height;
  final double blur;
  final Offset offset;
  final Color shadowColor;
  final Widget? child;

  const InnerShadowBox({
    super.key,
    required this.width,
    required this.height,
    this.blur = 4.01,
    this.offset = const Offset(0, 1.34),
    this.shadowColor = Colors.red,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Stack(
        children: [
          if (child != null) child!,
          // Inner shadow layer
          CustomPaint(
            size: Size(width, height),
            painter: _InnerShadowPainter(
              blur: blur,
              offset: offset,
              color: shadowColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _InnerShadowPainter extends CustomPainter {
  final double blur;
  final Offset offset;
  final Color color;

  _InnerShadowPainter({
    required this.blur,
    required this.offset,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Offset.zero & size;

    // نرسم الظل داخل الـ rect
    Paint paint = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blur);

    // نرسم الظل من فوق ونقص الوسط باستخدام BlendMode.dstOut
    canvas.saveLayer(rect, Paint());

    // نرسم مستطيل أكبر مع offset
    canvas.drawRect(rect.shift(offset), paint);

    // نمسح الوسط عشان يفضل الظل من جوه فقط
    Paint clear = Paint()..blendMode = BlendMode.dstOut;
    canvas.drawRect(rect, clear);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
