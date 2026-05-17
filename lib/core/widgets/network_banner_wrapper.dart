import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/theming/app_colors.dart';
import '../manager/network_cubit/network_cubit.dart';
import '../theming/app_styles.dart';

class NetworkBannerWrapper extends StatelessWidget {
  final Widget child;

  const NetworkBannerWrapper({super.key, required this.child});

  void _showBanner({required BuildContext context, required bool isConnected}) {
    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentMaterialBanner();
    if (isConnected) {
      messenger.showMaterialBanner(
        MaterialBanner(
          backgroundColor: AppColors.brandGreen,
          content: Text(
            'Internet connection restored',
            style: AppStyles.bold15.copyWith(color: Colors.white),
          ),
          minActionBarHeight: 40.0,
          actions: const [SizedBox.shrink()],
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        messenger.hideCurrentMaterialBanner();
      });
    } else {
      messenger.showMaterialBanner(
        MaterialBanner(
          backgroundColor: AppColors.bodyGray,
          content: Text(
            'No internet connection',
            style: AppStyles.bold15.copyWith(color: Colors.white),
          ),
          minActionBarHeight: 40.0,
          actions: const [SizedBox.shrink()],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Builder(
        builder: (innerContext) {
          return BlocListener<NetworkCubit, NetworkState>(
            listener: (context, state) {
              switch (state.status) {
                case NetworkStatus.connected:
                  _showBanner(context: innerContext, isConnected: true);
                  break;
                case NetworkStatus.disconnected:
                  _showBanner(context: innerContext, isConnected: false);
                  break;
                case NetworkStatus.unknown:
                  null;
                  break;
              }
            },
            child: child,
          );
        },
      ),
    );
  }
}
