import '../../../../core/constants/constants.dart';
import '../../../../core/functions/get_user.dart';
import '../models/subscription_model.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/services/supabase_crud_service.dart';

class SubscriptionService {
  final SupabaseCRUDService supabaseCRUDService;

  SubscriptionService({required this.supabaseCRUDService});

  Future<String> createSubscription({
    required String type, // monthly / yearly
    required String transactionId,
  }) async {
    final startDate = DateTime.now();
    final endDate = type == 'monthly'
        ? startDate.add(const Duration(days: 30))
        : startDate.add(const Duration(days: 365));

    const uuid = Uuid();
    final subscription = SubscriptionModel(
      id: uuid.v4(),
      userId: getUser()!.userId,
      type: type,
      startDate: startDate,
      endDate: endDate,
      status: 'active',
      transactionId: transactionId,
    );

    final String status = await supabaseCRUDService.addDataAndReturnField(
      field: 'status',
      table: kSubscriptionsTable,
      data: subscription.toJson(),
    );

    return status;
  }

  Future<SubscriptionModel?> getUserActiveSubscription() async {
    final data = await supabaseCRUDService.getData(
      table: kSubscriptionsTable,
      filters: {'user_id': getUser()!.userId, 'status': 'active'},
    );

    if (data.isEmpty) return null;

    // Get active subscription
    final subscription = data
        .map((e) => SubscriptionModel.fromJson(e))
        .firstWhere((sub) => sub.isActive);

    return subscription;
  }
}
