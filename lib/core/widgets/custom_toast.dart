import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CustomToast {
  static void showToast(message, {Color? color}) {
    toastification.show(
      alignment: Alignment.topCenter,
      showProgressBar: false,
      applyBlurEffect: false,
      style: ToastificationStyle.fillColored,
      icon: const SizedBox.shrink(),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      borderRadius: BorderRadius.circular(12),
      backgroundColor: color ?? const Color(0xff1E3A8A),
      primaryColor: color ?? const Color(0xff1E3A8A),
      pauseOnHover: false,
      dragToClose: true,
      title: Text(
        message,
        maxLines: 100,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          // lineHeight: 1.3,
          color: Colors.white,
        ),
      ),
      autoCloseDuration: const Duration(seconds: 5),
    );
    // toastification.show(
    //   showProgressBar: false,
    //   style: ToastificationStyle.flatColored,
    //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    //   margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    //   borderRadius: BorderRadius.circular(12),
    //   backgroundColor: color ?? const Color(0xff1E3A8A),
    //   primaryColor: color ?? const Color(0xff1E3A8A),
    //   // closeButtonShowType: CloseButtonShowType.always,
    //   pauseOnHover: true,
    //   dragToClose: true,
    //   // context: context,
    //   title: Text(
    //     message,
    //     maxLines: 100,
    //     overflow: TextOverflow.ellipsis,
    //     style: const TextStyle(
    //       // lineHeight: 1.3,
    //       color: Colors.white,
    //     ),
    //   ),
    //   autoCloseDuration: const Duration(seconds: 5),
    // );
  }
}
