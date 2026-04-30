import 'package:flutter/material.dart';
import '../../../../core/enums/fade_position.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/fade_scrollable.dart';
import '../widgets/shared/meditations_view_body.dart';

class MeditationsView extends StatelessWidget {
  final bool isPremium;
  const MeditationsView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(title: "Meditations", isPremium: isPremium),
      body: FadeScrollable(
        fadePosition: FadePosition.bottom,
        child: MeditationsViewBody(isPremium: isPremium),
      ),
    );
  }
}
