import '../../../../core/theming/app_assets.dart';

class PaymentMethodModel {
  final String title;
  final String icon;
  final bool isSvg;

  const PaymentMethodModel({
    required this.title,
    required this.icon,
    required this.isSvg,
  });
}

const List<PaymentMethodModel> paymentMethods = [
  PaymentMethodModel(title: 'Paypal', icon: AppAssets.paypalLogo, isSvg: true),
  PaymentMethodModel(title: 'Stripe', icon: AppAssets.stripeLogo, isSvg: true),
  PaymentMethodModel(title: 'Paymob', icon: AppAssets.paymobLogo, isSvg: true),
];
