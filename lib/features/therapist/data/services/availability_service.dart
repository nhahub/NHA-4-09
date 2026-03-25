import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/time_slot_model.dart';

class AvailabilityService {
  final SupabaseCRUDService supabaseCRUDService;

  AvailabilityService({required this.supabaseCRUDService});

  Future<Map<int, List<TimeSlotModel>>> getTimeSlots({
    required String therapistId,
  }) async {
    final rows = await supabaseCRUDService.getData(
      table: kTimeSlotsTable,
      filters: {'therapist_id': therapistId},
      orderBy: 'start_time',
    );

    final slots = rows.map((row) => TimeSlotModel.fromJson(row)).toList();

    final Map<int, List<TimeSlotModel>> slotsByDay = {};
    for (var slot in slots) {
      slotsByDay.putIfAbsent(slot.dayOfWeek, () => []);
      slotsByDay[slot.dayOfWeek]!.add(slot);
    }

    return slotsByDay;
  }
}
