import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:suitup/src/suitup_theme.dart';

class SuitupLoading {
  static initOnMain() => EasyLoading.instance
    ..displayDuration = const Duration(seconds: 5)
    ..indicatorType = EasyLoadingIndicatorType.doubleBounce
    ..loadingStyle = EasyLoadingStyle.light
    // ..backgroundColor = SuitupTheme.color.background
    ..radius = const Radius.circular(16).x
    ..fontSize = 16.0
    ..maskType = EasyLoadingMaskType.custom
    ..maskColor = Colors.black.withOpacity(0.3)
    ..userInteractions = false
    ..dismissOnTap = true
    ..infoWidget = Icon(Icons.info_outline, size: 48, color: SuitupTheme.color.primaryDark)
    ..errorWidget = Icon(Icons.new_releases_outlined, size: 48, color: SuitupTheme.color.redDark)
    ..successWidget = Icon(Icons.check_circle_outline, size: 48, color: SuitupTheme.color.greenDark);
  // ..indicatorWidget = const Icon(Icons.abc);

  static show([String text = 'Aguarde...']) => EasyLoading.show(status: text);
  static dismiss() => EasyLoading.dismiss();
}
