import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../theming/app_colors.dart';

class CustomSnackbar {
  static void show(
    BuildContext context,
    String message, {
    bool isError = false,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: isError
          ? 5
          : 3, // Duration: 5 seconds for error, 3 for success
      backgroundColor: isError
          ? AppColors.darkRed
          : AppColors.lightGreen, // Background color
      textColor: Colors.white, // Text color
      fontSize: 16.0, // Font size for consistency
    );
  }
}
