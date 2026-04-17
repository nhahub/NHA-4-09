import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/confirm_dialog.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/models/user_data_model.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../auth/presentation/widgets/Register/name_text_field.dart';
import '../../manager/update_profile_cubit/update_profile_cubit.dart';
import 'change_picture_button.dart';
import 'profile_avatar.dart';
import 'profile_email_section.dart';
import 'profile_phone_field.dart';

class UpdateProfileForm extends StatefulWidget {
  const UpdateProfileForm({super.key});

  @override
  State<UpdateProfileForm> createState() => _UpdateProfileFormState();
}

class _UpdateProfileFormState extends State<UpdateProfileForm> {
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          errorDialog(context: context, message: state.error!);
        } else if (state.status.isSuccess) {
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
                  ProfileAvatar(
                    user: user,
                    file: state.file,
                    imageVersion: state.imageVersion,
                  ),
                  const SizedBox(height: 5),
                  const ChangePictureButton(),
                  NameTextField(nameController: nameController),
                  const SizedBox(height: 20),
                  const ProfilePhoneField(),
                  const SizedBox(height: 20),
                  ProfileEmailSection(user: user),
                  const SizedBox(height: 30),
                  BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                    builder: (context, state) {
                      return IgnorePointer(
                        ignoring: state.status.isLoading,
                        child: SizedBox(
                          width: double.infinity,
                          child: AppTextButton(
                            onPressed: () => validateThenEditProfile(context),
                            buttonText: "Save Changes",
                            child: state.status.isLoading
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
      final String? newPhone = cubit.state.phoneNumber;
      final String? oldNumber = user?.phone;
      final File? file = cubit.state.file;

      context.read<UpdateProfileCubit>().updateProfile(
        name: nameController.text.trim() == user?.name
            ? null
            : nameController.text.trim(),
        phone: newPhone == oldNumber ? null : newPhone,
        file: file,
      );
    }
  }
}
