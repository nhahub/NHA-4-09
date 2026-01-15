import '../../../../core/theming/app_assets.dart';

class PremiumOfferModel {
  final String title;
  final String subtitle;
  final String icon;

  const PremiumOfferModel({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

const List<PremiumOfferModel> premiumOffers = [
  PremiumOfferModel(
    title: 'Emotional tracking',
    subtitle: 'Charts, stats, and a daily routine.',
    icon: AppAssets.chartBarIcon,
  ),
  PremiumOfferModel(
    title: 'Therapy discounts',
    subtitle: 'Lower prices for video and chat sessions.',
    icon: AppAssets.percentIcon,
  ),
  PremiumOfferModel(
    title: 'Full meditation access',
    subtitle: 'Unlimited access to all meditations.',
    icon: AppAssets.flowerLotusIcon,
  ),
  PremiumOfferModel(
    title: 'Early access to new features',
    subtitle: 'Be the first to try upcoming tools.',
    icon: AppAssets.sparkleIcon,
  ),
];
