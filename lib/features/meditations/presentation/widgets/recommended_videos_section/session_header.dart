import 'package:flutter/material.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/video_model.dart';
import 'background_image.dart';
import 'bottom_gradient.dart';

class SessionHeader extends StatefulWidget {
  final VideoModel videoModel;
  final bool isPlaying;
  final VoidCallback onImageTap;
  final Widget? videoPlayerWidget;

  const SessionHeader({
    super.key,
    required this.videoModel,
    required this.isPlaying,
    required this.onImageTap,
    this.videoPlayerWidget,
  });

  @override
  State<SessionHeader> createState() => _SessionHeaderState();
}

class _SessionHeaderState extends State<SessionHeader> {
  double _overlayOpacity = 1.0;

  @override
  void didUpdateWidget(SessionHeader oldWidget) {
    super.didUpdateWidget(oldWidget);

    final justStartedPlaying = !oldWidget.isPlaying && widget.isPlaying;
    final justPaused = oldWidget.isPlaying && !widget.isPlaying;

    if (justStartedPlaying) {
      // Show play icon briefly, then fade out.
      setState(() => _overlayOpacity = 1.0);
      Future.delayed(const Duration(milliseconds: 600), () {
        if (mounted && widget.isPlaying) {
          setState(() => _overlayOpacity = 0.0);
        }
      });
    } else if (justPaused) {
      // Show pause icon and keep it visible.
      setState(() => _overlayOpacity = 1.0);
    }
  }

  IconData get _overlayIcon =>
      widget.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: GestureDetector(
        onTap: widget.onImageTap,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image or Video Player
              if (widget.videoPlayerWidget != null)
                widget.videoPlayerWidget!
              else
                BackgroundImage(imageUrl: widget.videoModel.coverUrl),

              // Dark gradient overlay (bottom)
              const BottomGradient(),

              // Centered play/pause overlay icon
              Center(
                child: AnimatedOpacity(
                  opacity: _overlayOpacity,
                  duration: const Duration(milliseconds: 250),
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.38),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(_overlayIcon, color: Colors.white, size: 34),
                  ),
                ),
              ),

              // Title and duration
              Positioned(
                left: 16,
                right: 16,
                bottom: 16,
                child: AnimatedOpacity(
                  opacity: _overlayOpacity,
                  duration: const Duration(milliseconds: 250),
                  child: Column(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.videoModel.title,
                        style: AppStyles.extraBold18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${widget.videoModel.duration.toInt()} min',
                        style: AppStyles.medium14.copyWith(
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
