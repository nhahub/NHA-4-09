import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/persona/persona_bloc_builder.dart';
import 'persona_app_bar.dart';

class PersonaView extends StatelessWidget {
  const PersonaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PersonaAppBar(),
        body: PersonaBlocBuilder(),
      ),
    );
  }
}
