import 'dart:async';

import 'package:template/core/extention/build_extention.dart';
import 'package:template/core/resources/routes/app_navigation.dart';
import 'package:template/core/resources/routes/app_routes.dart';
import 'package:template/core/utils/assets_drawables.dart';
import 'package:template/core/utils/drawable.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      /* final userData = await BasePreferences.getSecurePref(AppConstant.userKey);
      if (userData != null && userData.isNotEmpty) {
        AppNavigation.pushReplacementTo(AppRoutes.homeRoute);
      } else {
      }*/
      AppNavigation.pushReplacementTo(AppRoutes.walkThroughRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.backgroundColor,
      body: const Center(
        child: DelayedDisplay(
            fadingDuration: Duration(seconds: 3),
            slidingCurve: Curves.ease,
            child: SvgDrawable(
              drawable: Drawables.logo,
              width: 200,
              height: 200,
            )),
      ),
    );
  }
}
