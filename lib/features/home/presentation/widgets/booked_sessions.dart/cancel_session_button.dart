import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../manager/get_booking_sessions_cubit/get_booking_sessions_cubit.dart';
import '../../../../therapist/data/models/booking_model.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/widgets/custom_dialog.dart';

class CancelSessionButton extends StatelessWidget {
  const CancelSessionButton({super.key, required this.bookingModel});

  final BookingModel bookingModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (dialogContext) {
            return CustomDialog(
              buttonText: "Delete",
              bodyContent: "Are you sure you want to cancel this session",
              title: "Cancel Session?",
              buttonColor: AppColors.darkRed,
              onPressed: () {
                dialogContext.pop();
                context.read<GetBookingSessionsCubit>().cancelSession(
                  bookingId: bookingModel.id,
                  slotId: bookingModel.slotId,
                );
              },
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey[200],
        child: SvgPicture.asset(
          AppAssets.trashIcon,
          width: 18,
          height: 18,
          colorFilter: const ColorFilter.mode(
            AppColors.linkGray,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
