import 'package:flutter/material.dart';
import '../../../data/models/meditation_session.dart';

class SessionDetailsCard extends StatelessWidget {
  final MeditationSession session;

  const SessionDetailsCard({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    final durationLabel =
        '${session.durationSeconds ~/ 60} minutes';

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
      child: Column(
        children: [
          // Row 1: Duration | Level
          Row(
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
                  label: 'Level',
                  labelColor: const Color(0xFFE6A817),
                  value: session.level,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(height: 1, color: Color(0xFFF2F2F2)),
          const SizedBox(height: 20),

          // Row 2: Focus | Type
          Row(
            children: [
              Expanded(
                child: _DetailItem(
                  label: 'Focus',
                  labelColor: const Color(0xFF3DBE7E),
                  value: session.focus,
                ),
              ),
              Expanded(
                child: _DetailItem(
                  label: 'Type',
                  labelColor: const Color(0xFFE6A817),
                  value: session.type,
                ),
              ),
            ],
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
