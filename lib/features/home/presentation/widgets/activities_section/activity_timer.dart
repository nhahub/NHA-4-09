import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';

class ActivityTimer extends StatefulWidget {
  final int minutes;
  final double size;

  const ActivityTimer({super.key, required this.minutes, this.size = 65});

  @override
  State<ActivityTimer> createState() => _ActivityTimerState();
}

class _ActivityTimerState extends State<ActivityTimer> {
  late int totalSeconds;
  int remainingSeconds = 0;
  double progress = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    totalSeconds = widget.minutes * 60;
    remainingSeconds = totalSeconds;
  }

  void start() {
    timer?.cancel();

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
          progress = 1 - (remainingSeconds / totalSeconds);
        });
      } else {
        t.cancel();
      }
    });
  }

  String formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return "${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: start,
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Border
            SizedBox(
              width: widget.size,
              height: widget.size,
              child: const CircularProgressIndicator(
                value: 1,
                strokeWidth: 5,
                valueColor: AlwaysStoppedAnimation(AppColors.lightGrey),
              ),
            ),

            // Progress Border
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: progress),
              duration: const Duration(milliseconds: 300),
              builder: (context, value, _) {
                return SizedBox(
                  width: widget.size,
                  height: widget.size,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 5,
                    strokeCap: StrokeCap.round,
                    valueColor: const AlwaysStoppedAnimation(
                      AppColors.lightGreen,
                    ),
                  ),
                );
              },
            ),
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.brandGreen,
              child: Text(
                formatTime(remainingSeconds),
                style: AppStyles.bold14.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
