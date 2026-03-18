import 'package:flutter/material.dart';
import 'package:flutter_paymob/billing_data.dart';
import 'package:flutter_paymob/flutter_paymob.dart';
import 'package:flutter_paymob/paymob_response.dart';

import '../../../../core/constants/app_keys.dart';

class PaymobService {
  static Future<void> init() async {
    await FlutterPaymob.instance.initialize(
      apiKey: ApiKeys.paymobApiKey,
      integrationID: int.parse(ApiKeys.integrationIdCard),
      walletIntegrationId: int.parse(ApiKeys.integrationIdWallet),
      iFrameID: int.parse(ApiKeys.iFrameIdCard),
    );
  }

  Future<String?> payWithCard({
    required BuildContext context,
    required double amount,
    required BillingData billingData,
    required Function(PaymentPaymobResponse)? onPayment,
  }) async {
    FlutterPaymob.instance.payWithCard(
      context: context,
      currency: "EGP",
      amount: amount,
      billingData: billingData,
      onPayment: onPayment,
    );
    return null;
  }
}
