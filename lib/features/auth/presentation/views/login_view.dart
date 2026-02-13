import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

import '../widgets/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(appBar: BackButtonAppbar(), body: LoginViewBody()),
    );
  }
}
