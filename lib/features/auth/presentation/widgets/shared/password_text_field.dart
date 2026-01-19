// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/helpers/validate_password.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController passwordController;
  bool isPasswordObscureText = true;

  PasswordTextField({
    super.key,
    required this.passwordController,
    this.isPasswordObscureText = true,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 10),
          child: Text(
            "Password",
            style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
          ),
        ),
        AppTextFormField(
          hintText: "Enter Your Password",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 4),
            child: SvgPicture.asset(
              AppAssets.passwordIcon,
              height: 22,
              colorFilter: const ColorFilter.mode(
                AppColors.brandGreen,
                BlendMode.srcIn,
              ),
            ),
          ),
          isObscureText: widget.isPasswordObscureText,
          controller: widget.passwordController,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.isPasswordObscureText = !widget.isPasswordObscureText;
              });
            },
            icon: Icon(
              widget.isPasswordObscureText
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: AppColors.brandGreen,
            ),
          ),
          validator: validatePassword,
        ),
      ],
    );
  }
}
