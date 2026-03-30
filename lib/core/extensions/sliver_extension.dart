import 'package:flutter/material.dart';

extension SliverExtension on Widget {
  Widget toSliver() {
    return SliverToBoxAdapter(child: this);
  }
}
