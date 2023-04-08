import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// This extension will allow to get the file extension easily
extension SuitupFileUtils on File {
  String get ext =>
      path.replaceAll(RegExp(r'\?.+'), '').replaceAll(RegExp(r'.+\.'), '');
}

/// This extension supose to retrieve the global position of a
/// widget on the screen
///
/// https://stackoverflow.com/questions/50316219/how-to-get-widgets-absolute-coordinates-on-a-screen-in-flutter
extension SuitupGlobalKeyEx on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null) {
      return renderObject!.paintBounds
          .shift(Offset(translation.x, translation.y));
    }
    return null;
  }
}

extension SuitupColorUtils on Color {
  /// This method will parse this color to a Hexadecimal String representation
  /// like: #005522
  String get toHex => '#${value.toRadixString(16).substring(2, 8)}';

  /// This method will apply dark or light color for text depending on the
  /// luminance of background color.
  Color get contrast {
    return computeLuminance() <= .5
        ? const Color.fromRGBO(221, 221, 221, 1)
        : const Color.fromRGBO(51, 51, 51, 1);
  }
}

extension SuitupStringUtils on String {
  // This method will parse this string to a Color object
  // Ex.: from #225533 to Color object
  Color get hexToColor {
    if (isEmpty) {
      return Colors.transparent;
    }
    var hexColor = toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor"; // Opacity
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${toLowerCase().substring(1)}";
  }

  /// Attention. It will throw an exception if the email is an empty string.
  bool isValidEmail() {
    final email = trim().toLowerCase();

    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}

extension SuitupDoubleUtils on double {
  String toMoney({String? locale, String? symbol}) => NumberFormat.currency(
        locale: locale ?? 'pt_BR',
        symbol: symbol ?? 'R\$',
      ).format(this);
}
