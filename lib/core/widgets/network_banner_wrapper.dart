import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/theming/app_colors.dart';
import '../manager/network_cubit/network_cubit.dart';
import '../theming/app_styles.dart';

class NetworkBannerWrapper extends StatelessWidget {
  final Widget child;

  const NetworkBannerWrapper({super.key, required this.child});

  void _showBanner({required BuildContext context, required bool isConnected}) {
    final messenger = ScaffoldMessenger.maybeOf(context);

    if (messenger == null) return;

    messenger.hideCurrentMaterialBanner();

    messenger.showMaterialBanner(
      MaterialBanner(
        backgroundColor: isConnected
            ? AppColors.brandGreen
            : AppColors.bodyGray,
        minActionBarHeight: 38,
        elevation: 0,
        forceActionsBelow: false,
        content: Text(
          isConnected
              ? 'Internet connection restored'
              : 'No internet connection',
          style: AppStyles.bold15.copyWith(color: Colors.white),
        ),
        dividerColor: Colors.transparent,
        actions: const [SizedBox.shrink()],
      ),
    );

    if (isConnected) {
      Future.delayed(const Duration(seconds: 2), () {
        messenger.hideCurrentMaterialBanner();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkCubit, NetworkState>(
      listener: (context, state) {
        switch (state.status) {
          case NetworkStatus.connected:
          case NetworkStatus.reconnected:
            _showBanner(context: context, isConnected: true);
            break;
          case NetworkStatus.disconnected:
            _showBanner(context: context, isConnected: false);
            break;
          case NetworkStatus.unknown:
            break;
        }
      },
      child: child,
    );
  }
}
