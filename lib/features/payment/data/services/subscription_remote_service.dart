import '../../../../core/constants/constants.dart';
import '../../../../core/functions/get_user.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/subscription_model.dart';

class SubscriptionRemoteService {
  final SupabaseCRUDService supabaseCRUDService;

  SubscriptionRemoteService({required this.supabaseCRUDService});

  Future<SubscriptionModel> createUserSubscription({
    required String type, // monthly / yearly
  }) async {
    final startDate = DateTime.now();
    final endDate = type == 'monthly'
        ? startDate.add(const Duration(days: 30))
        : startDate.add(const Duration(days: 365));

    final subscription = SubscriptionModel(
      userId: getUser()!.userId,
      type: type,
      startDate: startDate,
      endDate: endDate,
      status: 'active',
    );

    final Map<String, dynamic> data = await supabaseCRUDService
        .upsertDataAndReturnRow(
          table: kSubscriptionsTable,
          data: subscription.toJson(),
          onConflict: 'user_id',
        );

    final SubscriptionModel subscriptionModel = SubscriptionModel.fromJson(
      data,
    );

    return subscriptionModel;
  }

  Future<SubscriptionModel?> getUserSubscription() async {
    final Map<String, dynamic>? data = await supabaseCRUDService.getSingleRow(
      table: kSubscriptionsTable,
      whereColumn: "user_id",
      whereValue: getUser()!.userId,
    );

    if (data == null) return null;
    final SubscriptionModel subscription = SubscriptionModel.fromJson(data);

    return subscription;
  }

  Future<void> deleteUserSubscription() async {
    await supabaseCRUDService.deleteData(
      table: kSubscriptionsTable,
      idColumn: "user_id",
      idValue: getUser()!.userId,
    );
  }
}
