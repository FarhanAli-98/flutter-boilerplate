import 'package:template/core/constants/app_constants.dart';
import 'package:template/core/di/app_provider.dart';
import 'package:template/core/resources/routes/app_navigation.dart';
import 'package:template/core/resources/routes/app_routes.dart';
import 'package:template/core/resources/routes/route_generator.dart';
import 'package:template/core/resources/theme/light_theme.dart';
import 'package:template/core/utils/assets_drawables.dart';
import 'package:template/core/utils/drawable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  @override
  Widget build(BuildContext context) {
    final currentThemeMode = ref.watch(themeModeProvider);

    return ToastificationWrapper(
      child: MaterialApp(
        title: AppConstant.appName,
        debugShowCheckedModeBanner: false,
        theme: LightTheme().themeData,
        themeMode: currentThemeMode,
        routes: AppRoutes.getRoutes(),
        navigatorKey: AppNavigation.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        builder: (context, child) {
          Widget content = child ?? const AppLoadingScreen();
          return content;
        },
      ),
    );
  }
}

class AppLoadingScreen extends StatelessWidget {
  const AppLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageDrawable(
              drawable: Drawables.logo,
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeWidth: 2.5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            SizedBox(height: 16),
            Text(
              "Initializing...",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
