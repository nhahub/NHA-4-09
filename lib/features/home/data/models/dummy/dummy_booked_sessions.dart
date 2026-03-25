import '../../../../../core/constants/constants.dart';
import '../../../../therapist/data/models/booking_model.dart';

class DummyBookedSessions {
  static List<BookingModel> dummyBookedSessions = List.generate(
    5,
    (index) => BookingModel(
      id: "",
      userId: "",
      sessionType: "",
      therapistId: '',
      therapistName: '',
      therapistSpeciality: '',
      therapistImage: kImagePlaceHolder,
      slotId: '',
      slotStartTime: DateTime.now(),
      slotEndTime: DateTime.now(),
      price: 0,
      status: "",
      createdAt: DateTime.now(),
    ),
  );
}
