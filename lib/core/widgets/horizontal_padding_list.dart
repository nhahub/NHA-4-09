import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HorizontalPaddingList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double height;
  final bool isLoading;

  const HorizontalPaddingList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.height,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Skeletonizer(
        containersColor: Colors.grey[50],
        enabled: isLoading,
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
      ),
    );
  }
}
