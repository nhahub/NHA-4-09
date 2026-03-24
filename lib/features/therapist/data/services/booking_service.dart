import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/services/supabase_crud_service.dart';

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
}
