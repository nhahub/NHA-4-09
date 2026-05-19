import 'package:flutter/material.dart';
import '../../../../../core/functions/build_snack_bar.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../therapist/data/models/booking_model.dart';

class BookedSessionActions {
  static void handleTap({
    required BuildContext context,
    required BookingModel bookingModel,
  }) {
    final now = DateTime.now();

    final start = bookingModel.slotStartTime;
    final end = bookingModel.slotEndTime;

    if (start == null || end == null) return;

    // Session has not started yet
    if (now.isBefore(start)) {
      warningSnackBar(context: context, message: 'Session has not started yet');
      return;
    }

    // Session has ended
    if (now.isAfter(end)) {
      errorSnackBar(context: context, message: 'Session has ended');
      return;
    }

    // Session is ongoing
    switch (bookingModel.sessionType) {
      case "chat":
        context.push(Routes.therapistChatView, args: bookingModel);
        break;

      case "call":
        context.push(Routes.therapistVideoCallView, args: bookingModel);
        break;

      default:
    }
  }
}
