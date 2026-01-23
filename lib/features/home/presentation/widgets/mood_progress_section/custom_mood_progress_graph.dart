import 'package:flutter/material.dart';
import '../../../data/models/mood_chart.dart';
import '../../../../../core/theming/app_styles.dart';
import 'graph_column.dart';
import 'grid_painter.dart';

class CustomMoodProgressGraph extends StatelessWidget {
  const CustomMoodProgressGraph({super.key});

  static const double maxY = 4;
  static const double barWidth = 33.39;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 202,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final chartHeight =
              constraints.maxHeight - 58; // reserved for bottom titles
          final chartWidth = constraints.maxWidth;
          final spacing =
              (chartWidth - barWidth * weekMood.length) / (weekMood.length + 1);

          return Stack(
            children: [
              /// ================= Grid Lines =================
              CustomPaint(
                size: Size(chartWidth, chartHeight),
                painter: GridPainter(maxY: maxY),
              ),

              /// ================= Bars + Emojis + Titles =================
              ...List.generate(weekMood.length, (index) {
                final mood = weekMood[index];
                final barHeight = (mood.value / maxY) * chartHeight;
                final left = spacing + index * (barWidth + spacing);
                final bottom = 30.0; // reserved space for titles

                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    /// Graph Column
                    Positioned(
                      left: left,
                      bottom: bottom,
                      child: GraphColumn(
                        barWidth: barWidth,
                        barHeight: barHeight,
                      ),
                    ),

                    /// Emoji
                    Positioned(
                      left: left + (barWidth / 2) - 12, // center emoji
                      bottom: bottom + barHeight + 4,
                      child: Image.asset(mood.emoji, width: 24, height: 24),
                    ),

                    /// Day title
                    Positioned(
                      left: left + (barWidth / 2) - 12, // center text
                      bottom: 0,
                      child: Text(
                        mood.day,
                        style: AppStyles.extraBold14.copyWith(
                          color: const Color(0xff7E7C8E),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
