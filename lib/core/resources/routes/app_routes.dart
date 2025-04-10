import 'package:template/features/auth/presentation/pages/onbording_screen.dart';
import 'package:template/features/auth/presentation/pages/splash_screen.dart';
import 'package:template/features/auth/presentation/pages/walkthrough_screen.dart';
import 'package:template/features/auth/presentation/pages/welcome_screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static const String initial = "/";
  static const String welcomeRoute = "/welcomeRoute";
  static const String walkThroughRoute = "/walkThroughRoute";
  static const String onBoardingRoute = "/onboardingRoute";
  static const String loginRoute = "/login";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String changePasswordRoute = "/changePassword";
  static const String otpVerifyRoute = '/otpVerifyRoute';
  static const String homeRoute = '/homeRoute';
  static const String subscriptionRoute = '/subscriptionRoute';
  static const String settingsRoute = '/settingsRoute';
  static const String announcementRoute = '/announcementRoute';
  static const String announcementDetailRoute = '/announcementDetailRoute';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      AppRoutes.initial: (BuildContext context) => const SplashScreen(),
      AppRoutes.welcomeRoute: (BuildContext context) => const WelcomeScreen(),
      AppRoutes.walkThroughRoute: (BuildContext context) => const WalkthroughScreen(),
      AppRoutes.onBoardingRoute: (BuildContext context) => const OnboardingScreen(),
    };
  }
}
