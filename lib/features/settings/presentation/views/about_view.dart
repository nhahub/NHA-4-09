import 'package:flutter/material.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BackButtonAppbar(title: "About"),
      body: Center(child: Text("About content goes here.")),
    );
  }
}
