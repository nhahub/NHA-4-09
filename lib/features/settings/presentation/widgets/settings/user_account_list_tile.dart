import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/get_user.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/user_avatar.dart';

class UserAccountListTile extends StatelessWidget {
  const UserAccountListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          context.push(Routes.editProfileView);
        },
        title: Text(getUser()?.name ?? '', style: AppStyles.extraBold17),
        subtitle: Text(
          getUser()?.email ?? '',
          style: AppStyles.regular14,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
        ),
        leading: UserAvatar(
          name: getUser()?.name ?? '',
          radius: 32,
          fontSize: 30,
          imageUrl: getUser()?.image,
        ),
      ),
    );
  }
}
