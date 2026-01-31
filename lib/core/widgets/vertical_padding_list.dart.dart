import 'package:flutter/material.dart';

import '../constants/constants.dart';

class VerticalPaddingList extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double endPadding;

  const VerticalPaddingList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.endPadding = kAppVerticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SliverList.separated(
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          return itemBuilder(context, index);
        },
      ),
    );
  }
}
