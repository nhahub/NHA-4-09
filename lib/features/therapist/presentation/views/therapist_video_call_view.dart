import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/routing/routes.dart';
import '../../data/services/zego_call_service.dart';
import '../manager/chat_cubit/chat_cubit.dart';

class TherapistVideoCallView extends StatelessWidget {
  final String callID;
  const TherapistVideoCallView({super.key, required this.callID});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (prev, curr) => prev.isSessionEnded != curr.isSessionEnded,
      listener: (context, state) {
        if (state.isSessionEnded) {
          errorDialog(
            context: context,
            message: "Session has ended",
            onPressed: () {
              context.pushAndRemoveUntil(Routes.mainView);
            },
          );
        }
      },
      child: ZegoUIKitPrebuiltCall(
        appID: ZegoCallService.appID,
        appSign: ZegoCallService.appSign,
        userID: ZegoCallService.userID,
        userName: ZegoCallService.userName,
        callID: callID,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      ),
    );
  }
}
