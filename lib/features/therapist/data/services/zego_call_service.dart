import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:moodly/core/functions/get_user.dart';

class ZegoCallService {
  static int get appID => int.parse(dotenv.env['ZEGO_APP_ID']!);
  static String get appSign => dotenv.env['ZEGO_APP_SIGN']!;
  static String get userID => getUser()!.userId;
  static String get userName => getUser()!.name!;
}
