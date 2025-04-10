import 'package:template/core/extention/build_extention.dart';
import 'package:template/core/resources/routes/app_navigation.dart';
import 'package:template/core/utils/assets_drawables.dart';
import 'package:template/core/utils/drawable.dart';
import 'package:flutter/material.dart';

class BackNavigation extends StatelessWidget {
  final Icon? startIcon;
  final VoidCallback? callback;
  final String title;
  final bool? hideBackButton;
  final Widget? endIcon;
  final EdgeInsets? padding;
  const BackNavigation({
    this.startIcon,
    this.callback,
    required this.title,
    this.hideBackButton,
    this.endIcon,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: hideBackButton ?? false
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: textTheme.displaySmall?.copyWith(
                    color: context.colorTheme.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )),
                if (endIcon != null) endIcon!
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    NavigationButton(
                        callback: callback ?? () => AppNavigation.goBack(),
                        icon: startIcon ??
                            const SvgDrawable(
                              drawable: Drawables.logo,
                              width: 24,
                              height: 24,
                            )),
                    Expanded(
                        child: Text(
                      title,
                      textAlign: TextAlign.center,
                      style: textTheme.displaySmall?.copyWith(
                        color: context.colorTheme.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )),
                    if (endIcon != null) endIcon!
                  ],
                ),
              ],
            ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String? iconAddress;
  final Widget? icon;
  final VoidCallback? callback;

  const NavigationButton({
    super.key,
    this.iconAddress,
    this.icon,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: iconAddress != null ? Image.asset(iconAddress!) : icon,
    );
  }
}
