import 'package:flutter/material.dart';

class ItemDivider extends StatelessWidget {
  const ItemDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      width: 10,
      thickness: 2,
      color: Color(0xffD9D7D7),
      indent: 10,
      endIndent: 10,
    );
  }
}
