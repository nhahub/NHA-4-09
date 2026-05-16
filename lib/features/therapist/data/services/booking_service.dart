import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/booking_model.dart';

class BookingService {
  final SupabaseCRUDService _supabaseCRUDService;

  BookingService({required SupabaseCRUDService supabaseCRUDService})
    : _supabaseCRUDService = supabaseCRUDService;

  Future<void> bookingSession({
    required BookingModel bookingModel,
    required String slotId,
  }) async {
    await _supabaseCRUDService.addData(
      table: kBookingsTable,
      data: bookingModel.toJson(),
    );
    await _supabaseCRUDService.updateData(
      table: kTimeSlotsTable,
      idColumn: "id",
      idValue: slotId,
      data: {'is_booked': true},
    );
  }

  Future<List<BookingModel>> getBookingSessions() async {
    final String currentUserId = getUser()!.userId;

    final List<Map<String, dynamic>> data = await _supabaseCRUDService.getData(
      table: kBookingsTable,
      orderBy: 'created_at',
      orFilters: 'user_id.eq.$currentUserId,therapist_id.eq.$currentUserId',
    );
    final now = DateTime.now();

    final sessions = data.map((item) => BookingModel.fromJson(item)).where((
      booking,
    ) {
      final end = booking.slotEndTime;
      if (end == null) return false;

      return end.isAfter(now);
    }).toList();

    return sessions;
  }

  Future<void> cancelSession({
    required String bookingId,
    required String slotId,
  }) async {
    await _supabaseCRUDService.deleteData(
      table: kBookingsTable,
      idColumn: 'id',
      idValue: bookingId,
    );
    await _supabaseCRUDService.updateData(
      table: kTimeSlotsTable,
      idColumn: "id",
      idValue: slotId,
      data: {'is_booked': false},
    );
  }
}
