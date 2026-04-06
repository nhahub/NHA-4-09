import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/booking_model.dart';

class BookingService {
  final SupabaseCRUDService supabaseCRUDService;

  BookingService({required this.supabaseCRUDService});

  Future<void> bookingSession({
    required BookingModel bookingModel,
    required String slotId,
  }) async {
    await supabaseCRUDService.addData(
      table: kBookingsTable,
      data: bookingModel.toJson(),
    );
    await supabaseCRUDService.updateData(
      table: kTimeSlotsTable,
      idColumn: "id",
      idValue: slotId,
      data: {'is_booked': true},
    );
  }

  Future<List<BookingModel>> getBookingSessions() async {
    final String currentUserId = getUser()!.userId;

    final List<Map<String, dynamic>> data = await supabaseCRUDService.getData(
      table: kBookingsTable,
      orderBy: 'created_at',
      filters: {"user_id": currentUserId},
    );

    return data.map((item) => BookingModel.fromJson(item)).toList();
  }

  Future<void> cancelSession({
    required String bookingId,
    required String slotId,
  }) async {
    await supabaseCRUDService.deleteData(
      table: kBookingsTable,
      idColumn: 'id',
      idValue: bookingId,
    );
    await supabaseCRUDService.updateData(
      table: kTimeSlotsTable,
      idColumn: "id",
      idValue: slotId,
      data: {'is_booked': false},
    );
  }
}
