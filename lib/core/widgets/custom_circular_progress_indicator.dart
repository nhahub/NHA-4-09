import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const CustomCircularProgressIndicator({
    super.key,
    this.color,
    this.size = 25,
  });

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(color: color ?? Colors.white, size: size);
  }
}
