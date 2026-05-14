import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiKeys {
  static final String supabaseUrl = dotenv.env['SUPABASE_URL']!;
  static final String supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;

  // Stripe
  static final String stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY']!;

  static final String stripePublishableKey =
      dotenv.env['STRIPE_PUBLISHABLE_KEY']!;

  // Paypal
  static final String paypalClientId = dotenv.env['PAYPAL_CLIENT_ID']!;

  static final String paypalSecretKey = dotenv.env['PAYPAL_SECRET_KEY']!;

  // Paymob Keys
  static final String paymobApiKey = dotenv.env['PAYMOB_API_KEY']!;
  static final String integrationIdCard =
      dotenv.env['PAYMOB_INTEGRATION_ID_CARD']!;
  static final String integrationIdWallet =
      dotenv.env['PAYMOB_INTEGRATION_ID_WALLET']!;
  static final String iFrameIdCard = dotenv.env['PAYMOB_IFRAME_ID_CARD']!;

  // Zego
  static final String zegoAppSign = dotenv.env['ZEGO_APP_SIGN']!;
  static final String zegoAppId = dotenv.env['ZEGO_APP_ID']!;

  // Google Books API Key
  static final String googleBooksApiKey = dotenv.env['GOOGLE_BOOKS_API_KEY']!;

  // Google AI API Key
  static final String googleAiApiKey = dotenv.env['GOOGLE_AI_API_KEY']!;
}
