// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../theming/app_colors.dart';
// import '../theming/app_styles.dart';
// import 'app_text_button.dart';
// import 'custom_circular_progress_indicator.dart';

// class BlocButton<C extends StateStreamable<S>, S> extends StatelessWidget {
//   final bool Function(S state)? isLoading;
//   final VoidCallback onPressed;
//   final String label;
//   final Color? backgroundColor;
//   final TextStyle? textStyle;
//   final double? buttonHeight;
//   final double? buttonWidth;
//   final double? verticalPadding;
//   final double? borderRadius;

//   const BlocButton({
//     super.key,
//     required this.onPressed,
//     required this.label,
//     required this.isLoading,
//     this.backgroundColor,
//     this.textStyle,
//     this.buttonHeight,
//     this.buttonWidth,
//     this.verticalPadding,
//     this.borderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<C, S>(
//       builder: (context, state) {
//         final bool loading = isLoading?.call(state) ?? false;
//         return IgnorePointer(
//           ignoring: loading,
//           child: AppTextButton(
//             backgroundColor: backgroundColor ?? AppColors.darkerBlue,
//             buttonHeight: buttonHeight,
//             buttonWidth: buttonWidth ?? double.infinity,
//             onPressed: onPressed,
//             verticalPadding: verticalPadding,
//             borderRadius: borderRadius,
//             child: loading
//                 ? const CustomCircularProgressIndicator()
//                 : Text(
//                     label,
//                     style:
//                         textStyle ??
//                         AppStyles.bold18.copyWith(color: Colors.white),
//                   ),
//           ),
//         );
//       },
//     );
//   }
// }
