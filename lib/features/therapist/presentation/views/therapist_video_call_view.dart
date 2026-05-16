import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../data/services/zego_call_service.dart';

class TherapistVideoCallView extends StatelessWidget {
  final String callID;
  const TherapistVideoCallView({super.key, required this.callID});

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: ZegoCallService.appID,
      appSign: ZegoCallService.appSign,
      userID: ZegoCallService.userID,
      userName: ZegoCallService.userName,
      callID: callID,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
