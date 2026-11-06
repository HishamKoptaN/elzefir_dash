// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/circle_logo.png
  AssetGenImage get circleLogo =>
      const AssetGenImage('assets/logos/circle_logo.png');

  /// File path: assets/logos/logo.jpg
  AssetGenImage get logoJpg => const AssetGenImage('assets/logos/logo.jpg');

  /// File path: assets/logos/logo.png
  AssetGenImage get logoPng => const AssetGenImage('assets/logos/logo.png');

  /// File path: assets/logos/logo1.png
  AssetGenImage get logo1 => const AssetGenImage('assets/logos/logo1.png');

  /// File path: assets/logos/logo_mark.png
  AssetGenImage get logoMark =>
      const AssetGenImage('assets/logos/logo_mark.png');

  /// File path: assets/logos/solid_logo.png
  AssetGenImage get solidLogo =>
      const AssetGenImage('assets/logos/solid_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    circleLogo,
    logoJpg,
    logoPng,
    logo1,
    logoMark,
    solidLogo,
  ];
}

class $AssetsMockGen {
  const $AssetsMockGen();

  /// File path: assets/mock/about.png
  AssetGenImage get aboutPng => const AssetGenImage('assets/mock/about.png');

  /// File path: assets/mock/about.svg
  String get aboutSvg => 'assets/mock/about.svg';

  /// File path: assets/mock/fried_fish_fillet.png
  AssetGenImage get friedFishFillet =>
      const AssetGenImage('assets/mock/fried_fish_fillet.png');

  /// File path: assets/mock/fried_squid.png
  AssetGenImage get friedSquid =>
      const AssetGenImage('assets/mock/fried_squid.png');

  /// File path: assets/mock/fried_tilapia.png
  AssetGenImage get friedTilapia =>
      const AssetGenImage('assets/mock/fried_tilapia.png');

  /// File path: assets/mock/grilled_mullet.png
  AssetGenImage get grilledMullet =>
      const AssetGenImage('assets/mock/grilled_mullet.png');

  /// File path: assets/mock/grilled_shrimp.png
  AssetGenImage get grilledShrimp =>
      const AssetGenImage('assets/mock/grilled_shrimp.png');

  /// File path: assets/mock/grilled_tilapia.png
  AssetGenImage get grilledTilapia =>
      const AssetGenImage('assets/mock/grilled_tilapia.png');

  /// File path: assets/mock/grilled_tuna_fish.png
  AssetGenImage get grilledTunaFish =>
      const AssetGenImage('assets/mock/grilled_tuna_fish.png');

  /// File path: assets/mock/offer.png
  AssetGenImage get offer => const AssetGenImage('assets/mock/offer.png');

  /// File path: assets/mock/saled.png
  AssetGenImage get saled => const AssetGenImage('assets/mock/saled.png');

  /// File path: assets/mock/sayadieh_rice.png
  AssetGenImage get sayadiehRice =>
      const AssetGenImage('assets/mock/sayadieh_rice.png');

  /// File path: assets/mock/seafood_soup.png
  AssetGenImage get seafoodSoup =>
      const AssetGenImage('assets/mock/seafood_soup.png');

  /// File path: assets/mock/tahini.png
  AssetGenImage get tahini => const AssetGenImage('assets/mock/tahini.png');

  /// List of all assets
  List<dynamic> get values => [
    aboutPng,
    aboutSvg,
    friedFishFillet,
    friedSquid,
    friedTilapia,
    grilledMullet,
    grilledShrimp,
    grilledTilapia,
    grilledTunaFish,
    offer,
    saled,
    sayadiehRice,
    seafoodSoup,
    tahini,
  ];
}

abstract final class Assets {
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const $AssetsMockGen mock = $AssetsMockGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
