import 'package:flutter/widgets.dart';

class MediaConfig {
  final BuildContext context;

  late final double _screenWidth;
  late final double _screenHeight;
  late final double _blockHorizontal;
  late final double _blockVertical;

  double get safeBlockHorizontal => _blockHorizontal;
  double get safeBlockVertical => _blockVertical;

  MediaConfig(this.context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    _screenWidth = mediaQueryData.size.width;
    _screenHeight = mediaQueryData.size.height;

    final double safeAreaHorizontal =
        mediaQueryData.padding.left + mediaQueryData.padding.right;
    final double safeAreaVertical =
        mediaQueryData.padding.top + mediaQueryData.padding.bottom;

    _blockHorizontal = (_screenWidth - safeAreaHorizontal) / 100;
    _blockVertical = (_screenHeight - safeAreaVertical) / 100;
  }
}
