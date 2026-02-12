import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class NameTextField extends StatelessWidget {
  final TextEditingController nameController;
  const NameTextField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 10),
          child: Text(
            "Name",
            style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
          ),
        ),
        AppTextFormField(
          textInputType: TextInputType.name,
          hintText: "Enter Your Name",
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 4),
            child: SvgPicture.asset(
              AppAssets.userCircleIcon,
              height: 25,
              colorFilter: const ColorFilter.mode(
                AppColors.brandGreen,
                BlendMode.srcIn,
              ),
            ),
          ),
          controller: nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your name";
            }
            return null;
          },
        ),
      ],
    );
  }
}
