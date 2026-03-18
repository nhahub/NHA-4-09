import 'package:flutter/material.dart';

import '../../../data/models/meditation_session.dart';

class AboutSessionCard extends StatelessWidget {
  final MeditationSession session;

  const AboutSessionCard({super.key, required this.session});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description text
          _DescriptionText(text: session.description),

          const SizedBox(height: 20),
          const Divider(height: 1, color: Color(0xFFF0F0F0)),
          const SizedBox(height: 20),

          // Instructor row
          _InstructorRow(session: session),
        ],
      ),
    );
  }
}

class _DescriptionText extends StatelessWidget {
  final String text;
  const _DescriptionText({required this.text});

  @override
  Widget build(BuildContext context) {
    // Replicate the reference: some words in teal, some in muted dark.
    // We'll render the whole text with a teal color to match reference.
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14.5,
          height: 1.65,
          color: Color(0xFF2E7D92),
        ),
        children: _buildSpans(text),
      ),
    );
  }

  /// Alternates teal and dark coloring word-by-word to match the reference
  /// image aesthetic (multicolor mixed paragraph look).
  List<TextSpan> _buildSpans(String text) {
    final words = text.split(' ');
    final List<TextSpan> spans = [];
    const teal = Color(0xFF2E7D92);
    const dark = Color(0xFF1E3A40);

    for (int i = 0; i < words.length; i++) {
      final color = (i % 3 == 1) ? dark : teal;
      spans.add(TextSpan(
        text: i == words.length - 1 ? words[i] : '${words[i]} ',
        style: TextStyle(color: color),
      ));
    }
    return spans;
  }
}

class _InstructorRow extends StatelessWidget {
  final MeditationSession session;
  const _InstructorRow({required this.session});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar circle with initials
        Container(
          width: 44,
          height: 44,
          decoration: const BoxDecoration(
            color: Color(0xFFD6F0E6),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              session.instructorInitials,
              style: const TextStyle(
                color: Color(0xFF3DBE7E),
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              session.instructorName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              session.instructorTitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF888888),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
