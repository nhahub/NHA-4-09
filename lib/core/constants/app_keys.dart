import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  static String get supabaseUrl => dotenv.env['SUPABASE_URL'] ?? '';
  static String get supabaseAnonKey => dotenv.env['SUPABASE_ANON_KEY'] ?? '';

  // Stripe
  static String get stripeSecretKey => dotenv.env['STRIPE_SECRET_KEY'] ?? '';

  static String get stripePublishableKey =>
      dotenv.env['STRIPE_PUBLISHABLE_KEY'] ?? '';

  // Paypal
  static String get paypalClientId => dotenv.env['PAYPAL_CLIENT_ID'] ?? '';

  static String get paypalSecretKey => dotenv.env['PAYPAL_SECRET_KEY'] ?? '';

  // Paymob Keys
  static String get paymobApiKey => dotenv.env['PAYMOB_API_KEY'] ?? '';
  static String get integrationIdCard =>
      dotenv.env['PAYMOB_INTEGRATION_ID_CARD'] ?? '';
  static String get integrationIdWallet =>
      dotenv.env['PAYMOB_INTEGRATION_ID_WALLET'] ?? '';
  static String get iFrameIdCard => dotenv.env['PAYMOB_IFRAME_ID_CARD'] ?? '';

  // Zego
  static String zegoAppSign = dotenv.env['ZEGO_APP_SIGN']!;
  static String zegoAppId = dotenv.env['ZEGO_APP_ID']!;
}
