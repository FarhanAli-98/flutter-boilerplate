import 'package:template/core/extention/build_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String? leadingIcon;
  final String hintText;
  final bool isEnable;
  final bool obscureText;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final FocusNode? node;
  final Function? onFieldSubmit;
  final ValueChanged<String?>? onChange;
  final TextDirection? direction;
  final TextInputAction? inputAction;
  final bool? readOnly, isFilled;
  final Function()? onTap;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final double? suffixPadding;
  final Color? fillColor;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final bool isDense;
  final bool showError;

  const CustomTextFormField({
    super.key,
    this.leadingIcon = "",
    this.hintText = "",
    this.obscureText = false,
    this.isEnable = true,
    this.inputType,
    this.isFilled = false,
    this.controller,
    this.node,
    this.maxLength,
    this.validator,
    this.onFieldSubmit,
    this.onChange,
    this.direction,
    this.fillColor,
    this.inputAction,
    this.readOnly = false,
    this.onTap,
    this.autoValidateMode,
    this.suffixWidget,
    this.suffixPadding = 0.0,
    this.isDense = false,
    this.showError = true,
    this.prefixWidget,
    this.inputFormatters,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    InputDecorationTheme inputDecorationTheme = Theme.of(context).inputDecorationTheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      maxLength: widget.maxLength,
      keyboardType: widget.inputType ?? TextInputType.name,
      obscureText: widget.obscureText,
      controller: widget.controller,
      onTap: widget.onTap,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      focusNode: widget.node,
      style: textTheme.bodyMedium?.copyWith(color: context.colorTheme.textColor),
      textInputAction: widget.inputAction,
      autovalidateMode: widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: widget.isEnable ? widget.fillColor ?? inputDecorationTheme.fillColor : context.colorTheme.borderColor,
          filled: inputDecorationTheme.filled,
          isDense: inputDecorationTheme.isDense,
          enabled: widget.isEnable,
          errorStyle: inputDecorationTheme.errorStyle,
          suffixIcon: widget.suffixWidget == null ? null : Padding(padding: EdgeInsets.all(widget.suffixPadding!), child: widget.suffixWidget),
          prefixIcon: widget.leadingIcon!.isNotEmpty ? Padding(padding: const EdgeInsets.all(15.0), child: SvgPicture.asset(widget.leadingIcon!, height: 2)) : widget.prefixWidget,
          contentPadding: inputDecorationTheme.contentPadding,
          border: inputDecorationTheme.border,
          focusedBorder: inputDecorationTheme.focusedBorder,
          focusedErrorBorder: inputDecorationTheme.focusedErrorBorder,
          disabledBorder: inputDecorationTheme.disabledBorder,
          enabledBorder: inputDecorationTheme.enabledBorder,
          hintText: widget.hintText,
          hintStyle: textTheme.bodyMedium?.copyWith(color: context.colorTheme.descriptionColor)),
      enabled: widget.isEnable,
      validator: widget.validator,
      onChanged: widget.onChange,
      onSaved: (newValue) => widget.controller!.text,
    );
  }
}
