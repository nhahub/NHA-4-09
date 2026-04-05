import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/helpers/logger.dart';
import 'package:moodly/features/settings/presentation/widgets/update_profile/phone_field.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/confirm_dialog.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/models/user_data_model.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/user_avatar.dart';
import '../../../../auth/presentation/widgets/Register/name_text_field.dart';
import '../../../../auth/presentation/widgets/shared/password_text_field.dart';
import '../../manager/update_profile_cubit/update_profile_cubit.dart';
import '../../../../auth/presentation/widgets/shared/email_text_field.dart';

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({super.key});

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    // phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state.error != null) {
          errorDialog(context: context, message: state.error!);
        } else if (state.userDataModel != null && state.isLoading == false) {
          confirmDialog(
            context: context,
            title: "Success",
            message: "Your profile has been updated",
            onConfirm: () => context.pop(),
          );
        }
      },
      builder: (context, state) {
        final UserDataModel? user = state.userDataModel;
        if (user != null && nameController.text.isEmpty) {
          nameController.text = user.name ?? "";
          emailController.text = user.email ?? "";
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserAvatar(name: user?.name ?? "", imageUrl: user?.picture),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Change Picture",
                      style: AppStyles.regular14.copyWith(
                        color: AppColors.linkGray,
                      ),
                    ),
                  ),
                  NameTextField(nameController: nameController),
                  const SizedBox(height: 20),
                  EmailTextField(emailController: emailController),
                  const SizedBox(height: 20),
                  // PhoneTextField(phoneController: phoneController),
                  const PhoneField<UpdateProfileCubit>(),

                  const SizedBox(height: 20),
                  PasswordTextField(
                    passwordController: passwordController,
                    text: "Password",
                    hintText: "Enter your password",
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                    builder: (context, state) {
                      return IgnorePointer(
                        ignoring: state.isLoading,
                        child: SizedBox(
                          width: double.infinity,
                          child: AppTextButton(
                            onPressed: () => validateThenEditProfile(context),
                            buttonText: "Save Changes",
                            child: state.isLoading
                                ? const CustomCircularProgressIndicator()
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  validateThenEditProfile(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final cubit = context.read<UpdateProfileCubit>();
      final user = cubit.state.userDataModel;
      final String? newPhone = cubit.phoneNumber;
      Logger.log("New phone number: $newPhone");

      context.read<UpdateProfileCubit>().updateUserProfile(
        name: nameController.text.trim() == user?.name
            ? null
            : nameController.text.trim(),

        // email: emailController.text.trim() == user?.email
        //     ? null
        //     : emailController.text.trim(),

        // phone: newPhone == user?.phone ? null : newPhone,

        // password: passwordController.text.isEmpty
        //     ? null
        //     : passwordController.text.trim(),
      );
    }
  }
}
