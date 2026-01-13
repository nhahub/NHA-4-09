import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailTextField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 10),
          child: Text(
            "Email",
            style: AppStyles.p.copyWith(color: AppColors.bodyGray),
          ),
        ),
        AppTextFormField(
          textInputType: TextInputType.emailAddress,
          hintText: "Enter Your Email",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 4),
            child: SvgPicture.asset(
              AppAssets.emailIcon,
              height: 25,
              colorFilter: const ColorFilter.mode(
                AppColors.brandGreen,
                BlendMode.srcIn,
              ),
            ),
          ),
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }
            if (!AppRegex.isEmailValid(value)) {
              return "Please enter a valid email";
            }
            return null;
          },
        ),
      ],
    );
  }
}
