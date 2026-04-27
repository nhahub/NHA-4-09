import 'package:flutter/material.dart';

import 'nav_button.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final bool isFirst;
  final bool isLast;
  final bool hasMultiple;

  const NavigationButtons({
    super.key,
    required this.onNext,
    required this.onPrevious,
    required this.isFirst,
    required this.isLast,
    required this.hasMultiple,
  });

  @override
  Widget build(BuildContext context) {
    final prevDisabled = isFirst || !hasMultiple;
    final nextDisabled = isLast || !hasMultiple;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NavButton(
          icon: Icons.arrow_back_ios_new,
          onTap: prevDisabled ? null : onPrevious,
        ),
        NavButton(
          icon: Icons.arrow_forward_ios,
          onTap: nextDisabled ? null : onNext,
        ),
      ],
    );
  }
}
