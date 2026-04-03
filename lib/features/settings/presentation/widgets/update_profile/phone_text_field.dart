import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController phoneController;
  const PhoneTextField({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 10),
          child: Text(
            "Phone",
            style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
          ),
        ),
        AppTextFormField(
          textInputType: TextInputType.emailAddress,
          hintText: "Enter Your Phone",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 4),
            child: SvgPicture.asset(
              AppAssets.phoneIcon,
              height: 19,
              colorFilter: const ColorFilter.mode(
                AppColors.brandGreen,
                BlendMode.srcIn,
              ),
            ),
          ),
          controller: phoneController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your phone number";
            }
            if (!AppRegex.isPhoneNumberValid(value)) {
              return "Please enter a valid phone number";
            }
            return null;
          },
        ),
      ],
    );
  }
}
