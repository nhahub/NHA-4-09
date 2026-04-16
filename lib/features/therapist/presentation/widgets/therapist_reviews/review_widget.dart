import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle? style;
  final TextStyle? actionStyle;

  const ExpandableText({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.style,
    this.actionStyle,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  bool isOverflowing = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkOverflow();
  }

  @override
  void didUpdateWidget(covariant ExpandableText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _checkOverflow();
    }
  }

  void _checkOverflow() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: widget.style ?? AppStyles.regular14,
      ),
      maxLines: widget.maxLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    isOverflowing = textPainter.didExceedMaxLines;
  }

  void _toggle() {
    if (!isOverflowing) return;
    setState(() => isExpanded = !isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle actionStyle =
        widget.actionStyle ??
        AppStyles.extraBold15.copyWith(
          color: isExpanded ? AppColors.orange : AppColors.lightGreen,
        );

    return GestureDetector(
      onTap: _toggle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            maxLines: isExpanded ? null : widget.maxLines,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: widget.style ?? AppStyles.regular14,
          ),

          if (isOverflowing) ...[
            const SizedBox(height: 4),
            Text(isExpanded ? "See less" : "See more", style: actionStyle),
          ],
        ],
      ),
    );
  }
}
