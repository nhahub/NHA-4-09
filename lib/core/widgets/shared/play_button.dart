import 'package:flutter/material.dart';
import '../../theming/app_assets.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppAssets.playCircle, width: 80, height: 80);
  }
}
