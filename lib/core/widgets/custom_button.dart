import 'package:template/core/constants/app_enums.dart';
import 'package:template/core/extention/build_extention.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final ButtonType? buttonType;
  final Color? color;
  final Color? disabledColor;
  final Color? fontColor;
  final double? elevation;
  final double? disabledElevation;
  final TextAlign? textAlign;

  final Size? minSize;
  final Size? maxSize;

  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;

  final Icon? tralingIcon;
  final Icon? icon;
  final Widget? leadingIcon;

  final VoidCallback? onPressed;
  final RoundedRectangleBorder? shapeBorder;
  final bool? titleAtStart;

  const CustomButton(
      {super.key,
      required this.title,
      this.color,
      this.disabledColor,
      this.fontColor,
      this.elevation,
      this.disabledElevation,
      this.minSize,
      this.maxSize,
      this.fontFamily,
      this.fontSize,
      this.fontWeight,
      this.tralingIcon,
      this.textAlign,
      this.icon,
      this.leadingIcon,
      this.onPressed,
      this.shapeBorder,
      this.titleAtStart,
      this.buttonType = ButtonType.primary});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return widget.buttonType == ButtonType.primary
        ? ElevatedButton(
            onPressed: widget.onPressed,
            style: _buildButtonStyle(context),
            child: SizedBox(
              width: widget.minSize?.width,
              child: Row(children: _buildRowChildren()),
            ),
          )
        : OutlinedButton(
            onPressed: widget.onPressed,
            style: _buildButtonStyle(context),
            child: SizedBox(
              width: widget.minSize?.width,
              child: Row(
                children: _buildRowChildren(),
              ),
            ),
          );
  }

  ButtonStyle _buildButtonStyle(BuildContext context) {
    return ElevatedButton.styleFrom(
      elevation: widget.elevation,
      backgroundColor: widget.color,
      minimumSize: widget.minSize,
      maximumSize: widget.maxSize,
      shape: widget.shapeBorder ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
      padding: EdgeInsets.zero,
      foregroundColor: widget.fontColor,
    ).merge(widget.buttonType == ButtonType.primary ? Theme.of(context).elevatedButtonTheme.style : Theme.of(context).outlinedButtonTheme.style);
  }

  List<Widget> _buildRowChildren() {
    final hasLeading = widget.leadingIcon != null;
    final hasTrailing = widget.tralingIcon != null || widget.icon != null;

    List<Widget> rowContent = [];

    if (hasLeading) {
      rowContent.add(Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: widget.leadingIcon!,
      ));
    }

    rowContent.add(Flexible(
      fit: FlexFit.loose,
      child: Text(
        widget.title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: context.textTheme.titleMedium?.copyWith(
          fontFamily: widget.fontFamily,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
          color: widget.fontColor,
        ),
      ),
    ));

    if (widget.tralingIcon != null) {
      rowContent.add(Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: widget.tralingIcon!,
      ));
    }

    if (widget.icon != null) {
      rowContent.add(Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: widget.icon!,
      ));
    }

    return [
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: rowContent,
        ),
      ),
    ];
  }
}
