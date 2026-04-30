import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/models/video_model.dart';

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
  // Controls the overlay icon opacity.
  // - paused: 1.0 (always visible)
  // - playing: 0.0 (hidden), or briefly 1.0 on state change then fades
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
        child: SizedBox(
          height: 220,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image or Video Player
              if (widget.videoPlayerWidget != null)
                widget.videoPlayerWidget!
              else
                _BackgroundImage(imageUrl: widget.videoModel.coverUrl),

              // Dark gradient overlay (bottom)
              _BottomGradient(),

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.videoModel.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${widget.videoModel.duration.toInt()} min',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final String? imageUrl;

  const _BackgroundImage({this.imageUrl});

  static const _fallbackColor = Color(0xFF2D4A6E);

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;

    if (url == null || url.isEmpty) {
      return Container(color: _fallbackColor);
    }

    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.cover,

      placeholder: (context, url) => Container(
        color: _fallbackColor,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white54,
            strokeWidth: 2,
          ),
        ),
      ),

      errorWidget: (context, url, error) => Container(
        color: _fallbackColor,
        child: const Icon(Icons.image_not_supported, color: Colors.white54),
      ),
    );
  }
}

class _BottomGradient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withValues(alpha: 0.20),
            Colors.black.withValues(alpha: 0.60),
          ],
          stops: const [0.4, 0.7, 1.0],
        ),
      ),
    );
  }
}