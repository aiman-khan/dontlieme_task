/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsPngsGen {
  const $AssetsPngsGen();

  /// File path: assets/pngs/like_icon.png
  AssetGenImage get likeIcon =>
      const AssetGenImage('assets/pngs/like_icon.png');

  /// File path: assets/pngs/unlike_icon.png
  AssetGenImage get unlikeIcon =>
      const AssetGenImage('assets/pngs/unlike_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [likeIcon, unlikeIcon];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/about_icon.svg
  SvgGenImage get aboutIcon => const SvgGenImage('assets/svgs/about_icon.svg');

  /// File path: assets/svgs/app_logo.svg
  SvgGenImage get appLogo => const SvgGenImage('assets/svgs/app_logo.svg');

  /// File path: assets/svgs/chat_icon.svg
  SvgGenImage get chatIcon => const SvgGenImage('assets/svgs/chat_icon.svg');

  /// File path: assets/svgs/fb_icon.svg
  SvgGenImage get fbIcon => const SvgGenImage('assets/svgs/fb_icon.svg');

  /// File path: assets/svgs/filter_icon.svg
  SvgGenImage get filterIcon =>
      const SvgGenImage('assets/svgs/filter_icon.svg');

  /// File path: assets/svgs/heart_icon.svg
  SvgGenImage get heartIcon => const SvgGenImage('assets/svgs/heart_icon.svg');

  /// File path: assets/svgs/home_icon.svg
  SvgGenImage get homeIcon => const SvgGenImage('assets/svgs/home_icon.svg');

  /// File path: assets/svgs/insta_icon.svg
  SvgGenImage get instaIcon => const SvgGenImage('assets/svgs/insta_icon.svg');

  /// File path: assets/svgs/location_icon.svg
  SvgGenImage get locationIcon =>
      const SvgGenImage('assets/svgs/location_icon.svg');

  /// File path: assets/svgs/menu_icon.svg
  SvgGenImage get menuIcon => const SvgGenImage('assets/svgs/menu_icon.svg');

  /// File path: assets/svgs/share_icon.svg
  SvgGenImage get shareIcon => const SvgGenImage('assets/svgs/share_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        aboutIcon,
        appLogo,
        chatIcon,
        fbIcon,
        filterIcon,
        heartIcon,
        homeIcon,
        instaIcon,
        locationIcon,
        menuIcon,
        shareIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngsGen pngs = $AssetsPngsGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
