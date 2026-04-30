import 'package:flutter/material.dart';

import '../../../data/models/video_model.dart';

class AboutSessionCard extends StatelessWidget {
  final VideoModel videoModel;

  const AboutSessionCard({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: _DescriptionText(text: videoModel.description),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final String text;
  const _DescriptionText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14.5,
        height: 1.65,
        color: Color(0xFF1E3A40),
      ),
    );
  }
}
