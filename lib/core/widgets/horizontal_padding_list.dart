import 'package:flutter/material.dart';

class HorizontalPaddingList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double height;

  const HorizontalPaddingList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: itemCount + 2,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          if (index == 0 || index == itemCount + 1) {
            return const SizedBox(width: 16);
          }
          return itemBuilder(context, index - 1);
        },
      ),
    );
  }
}
