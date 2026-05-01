import 'package:flutter/material.dart';
import 'detail_item.dart';

class SessionDetailsCard extends StatelessWidget {
  final double duration;
  final String category;

  const SessionDetailsCard({
    super.key,
    required this.duration,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final durationLabel = '${duration.toInt()} minutes';

    return Container(
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
            child: DetailItem(
              label: 'Duration',
              labelColor: const Color(0xFF3DBE7E),
              value: durationLabel,
            ),
          ),
          Expanded(
            child: DetailItem(
              label: 'Category',
              labelColor: const Color(0xFFE6A817),
              value: category,
            ),
          ),
        ],
      ),
    );
  }
}
