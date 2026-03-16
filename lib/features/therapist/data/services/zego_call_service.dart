import '../../../../core/constants/app_keys.dart';
import '../../../../core/functions/get_user.dart';

class ZegoCallService {
  static int get appID => int.parse(AppKeys.zegoAppId);
  static String get appSign => AppKeys.zegoAppSign;
  static String get userID => getUser()!.userId;
  static String get userName => getUser()!.name!;
}
