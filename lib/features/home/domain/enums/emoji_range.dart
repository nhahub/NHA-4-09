import '../../../../core/theming/app_assets.dart';

enum EmojiRange { veryBad, bad, neutral, good, veryGood }

extension EmojiRangeExtension on EmojiRange {
  String get emoji {
    switch (this) {
      case EmojiRange.veryBad:
        return AppAssets.veryBad;
      case EmojiRange.bad:
        return AppAssets.bad;
      case EmojiRange.neutral:
        return AppAssets.neutral;
      case EmojiRange.good:
        return AppAssets.good;
      case EmojiRange.veryGood:
        return AppAssets.veryGood;
    }
  }
}
