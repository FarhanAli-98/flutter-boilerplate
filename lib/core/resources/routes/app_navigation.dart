import 'package:template/core/resources/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AppNavigation {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentState?.overlay?.context;

  static goBack() {
    return navigatorKey.currentState?.pop();
  }

  static bool canBack() {
    return navigatorKey.currentState?.canPop() ?? false;
  }

  static void popUntilRoot(String routeName) {
    return navigatorKey.currentState?.popUntil((route) => route.settings.name == routeName);
  }

  static Future<dynamic> pushAndKillAll(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(routeName, ModalRoute.withName(AppRoutes.loginRoute));
  }

  static Future<dynamic> pushReplacementTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> pushTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }
}
