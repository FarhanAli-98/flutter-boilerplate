import 'package:template/core/constants/app_enums.dart';
import 'package:template/core/extention/build_extention.dart';
import 'package:template/core/resources/routes/app_navigation.dart';
import 'package:template/core/resources/routes/app_routes.dart';
import 'package:template/core/utils/assets_drawables.dart';
import 'package:template/core/utils/drawable.dart';
import 'package:template/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorTheme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            const SvgDrawable(
              drawable: Drawables.logo,
              fit: BoxFit.fill,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: CustomButton(
                title: "Continue with Google",
                buttonType: ButtonType.primary,
                color: context.colorTheme.primaryColor,
                fontColor: Colors.white,
                leadingIcon: const SvgDrawable(
                  drawable: Drawables.google,
                ),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                minSize: Size(context.width, 54),
                onPressed: () {
                  AppNavigation.pushTo(AppRoutes.onBoardingRoute);
                },
              ),
            ),
            CustomButton(
              title: "Continue with Apple",
              buttonType: ButtonType.primary,
              color: context.colorTheme.secondaryButton,
              fontColor: context.colorTheme.backgroundColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              leadingIcon: const SvgDrawable(
                drawable: Drawables.apple,
              ),
              minSize: Size(context.width, 54),
              onPressed: () {
                // AppNavigation.pushTo(AppRoutes.registerRoute);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
