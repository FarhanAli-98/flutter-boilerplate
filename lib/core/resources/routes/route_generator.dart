import 'package:template/core/resources/routes/app_routes.dart';
import 'package:template/features/auth/presentation/pages/onbording_screen.dart';
import 'package:template/features/auth/presentation/pages/splash_screen.dart';
import 'package:template/features/auth/presentation/pages/walkthrough_screen.dart';
import 'package:template/features/auth/presentation/pages/welcome_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return _screenRoute(const SplashScreen());
      case AppRoutes.welcomeRoute:
        return _screenRoute(const WelcomeScreen());
      case AppRoutes.walkThroughRoute:
        return _screenRoute(const WalkthroughScreen());
      case AppRoutes.onBoardingRoute:
        return _screenRoute(const OnboardingScreen());
      default:
        return _screenRoute(const WelcomeScreen());
    }
  }

  static Route<dynamic> _screenRoute(route) {
    return MaterialPageRoute(builder: (context) => route);
  }
}
