import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionActions {
  static void handleTap({
    required BuildContext context,
    required BookingModel bookingModel,
  }) {
    switch (bookingModel.sessionType) {
      case "chat":
        context.push(Routes.therapistChatView, args: bookingModel.therapistId);
        break;

      case "call":
        context.push(Routes.therapistLiveView, args: bookingModel.id);
        break;

      default:
    }
  }
}
