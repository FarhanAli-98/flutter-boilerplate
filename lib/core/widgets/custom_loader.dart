import 'package:template/core/extention/build_extention.dart';
import 'package:template/core/resources/routes/app_navigation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoading {
  static void hideLoadingIndicator() async {
    AppNavigation.goBack();
  }

  static void showLoadingIndicator({bool usePostFrameCallback = true}) {
    void showDialogFunction() {
      showDialog(
        context: AppNavigation.currentContext!,
        barrierDismissible: false,
        builder: (BuildContext context) => Center(
          child: LoadingAnimationWidget.waveDots(
            color: context.colorTheme.primaryColor,
            size: 55,
          ),
        ),
      );
    }

    if (usePostFrameCallback) {
      WidgetsBinding.instance.addPostFrameCallback((_) => showDialogFunction());
    } else {
      showDialogFunction();
    }
  }
}
