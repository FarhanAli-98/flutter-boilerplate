// ignore_for_file: deprecated_member_use

import 'package:template/core/utils/drawable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Get the path of the image depends on the theme of the app.
///
/// [context] is the [BuildContext] of the widget.
///
/// [drawable] is the [Drawables] enum which contains the path of the image.
mixin ImageDrawablePathMixin {
  String getPath(BuildContext context, Drawables drawable) {
    final brightness = Theme.of(context).brightness;
    switch (brightness) {
      case Brightness.light:
        return drawable.light;
      case Brightness.dark:
        return drawable.light;
    }
  }
}

/// [_AssetDrawable] is an abstraction that is used
/// to select the asset path based on the current theme [Theme.of(context).brightness].
/// It is abstract because I do not want to put if else conditions everywhere.

abstract class _AssetDrawable extends StatelessWidget with ImageDrawablePathMixin {
  const _AssetDrawable({super.key});

  Drawables get drawable;

  Widget buildImage(BuildContext context, String drawable);

  @override
  Widget build(BuildContext context) {
    return buildImage(context, getPath(context, drawable));
  }
}

/// A wrapper for [SvgPicture.asset], that selects the asset path
/// based on the current theme.
class SvgDrawable extends _AssetDrawable {
  @override
  final Drawables drawable;

  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Alignment alignment;

  const SvgDrawable({
    super.key,
    required this.drawable,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.alignment = Alignment.center,
  });

  @override
  Widget buildImage(BuildContext context, String drawable) {
    return SvgPicture.asset(
      drawable,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      color: color,
      alignment: alignment,
    );
  }
}

/// SvgIconDrawable
class SvgIconDrawable extends _AssetDrawable {
  @override
  final Drawables drawable;

  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;
  final Alignment alignment;

  const SvgIconDrawable({
    super.key,
    required this.drawable,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.alignment = Alignment.center,
  });

  @override
  Widget buildImage(BuildContext context, String drawable) {
    // to get the button theme color
    final defaultColorStyle = DefaultTextStyle.of(context).style.color;

    return SvgPicture.asset(
      drawable,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      color: color ?? defaultColorStyle,
      alignment: alignment,
    );
  }
}

/// A wrapper for [Image.asset], that selects the asset path
/// based on the current theme.
class ImageDrawable extends _AssetDrawable {
  @override
  final Drawables drawable;

  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final Color? color;
  final AlignmentGeometry alignment;

  const ImageDrawable({
    super.key,
    required this.drawable,
    this.width,
    this.height,
    this.fit,
    this.color,
    this.cacheWidth,
    this.cacheHeight,
    this.alignment = Alignment.center,
  });

  @override
  Widget buildImage(BuildContext context, String drawable) {
    return Image.asset(
      drawable,
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,
      alignment: alignment,
    );
  }

  ImageProvider image(BuildContext context) {
    return Image.asset(
      getPath(context, drawable),
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      color: color,
      alignment: alignment,
    ).image;
  }
}
