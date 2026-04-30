import 'package:flutter/material.dart';

import '../../../data/models/video_model.dart';

class SessionDetailsCard extends StatelessWidget {
  final VideoModel videoModel;

  const SessionDetailsCard({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    final durationLabel = '${videoModel.duration.toInt()} minutes';

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
      child: Row(
        children: [
          Expanded(
            child: _DetailItem(
              label: 'Duration',
              labelColor: const Color(0xFF3DBE7E),
              value: durationLabel,
            ),
          ),
          Expanded(
            child: _DetailItem(
              label: 'Category',
              labelColor: const Color(0xFFE6A817),
              value: videoModel.category,
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailItem extends StatelessWidget {
  final String label;
  final Color labelColor;
  final String value;

  const _DetailItem({
    required this.label,
    required this.labelColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: labelColor,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
      ],
    );
  }
}
