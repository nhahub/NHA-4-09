import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/user_avatar.dart';
import '../../manager/update_profile_cubit/update_profile_cubit.dart';

class UserAccountListTile extends StatelessWidget {
  const UserAccountListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
        builder: (context, state) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              final cubit = context.read<UpdateProfileCubit>();
              context.push(Routes.editProfileView, args: cubit);
            },
            title: Text(
              state.userDataModel?.name ?? '',
              style: AppStyles.extraBold17,
            ),
            subtitle: Text(
              state.userDataModel?.email ?? '',
              style: AppStyles.regular14,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
            leading: UserAvatar(
              name: state.userDataModel?.name ?? '',
              radius: 32,
              fontSize: 30,
              imageUrl:
                  "${state.userDataModel?.picture}?v=${state.imageVersion}",
            ),
          );
        },
      ),
    );
  }
}
