import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'suitup_theme.dart';

/// There is nothing here because this class is only suposed to
/// exists so the `SuitupTextAbstract` can be instantiated and
/// this abstract class allows the user to override its values
class SuitupText extends SuitupTextAbstract {}

/// Our default values for text typography
abstract class SuitupTextAbstract {
  double fontSize(double size) =>
      defaultTargetPlatform == TargetPlatform.android ? size - 2 : size;

  TextStyle get logoFont => GoogleFonts.courgette(
      fontSize: fontSize(26), color: SuitupTheme.color.surface);
  TextStyle get _base => GoogleFonts.rubik(
      fontSize: fontSize(12), color: SuitupTheme.color.surface);

  TextStyle get headline1 =>
      _base.copyWith(fontSize: fontSize(48), fontWeight: FontWeight.w300);
  TextStyle get headline2 =>
      _base.copyWith(fontSize: fontSize(32), fontWeight: FontWeight.w300);
  TextStyle get headline3 =>
      _base.copyWith(fontSize: fontSize(28), fontWeight: FontWeight.normal);
  TextStyle get headline4 =>
      _base.copyWith(fontSize: fontSize(24), fontWeight: FontWeight.normal);
  TextStyle get headline5 =>
      _base.copyWith(fontSize: fontSize(20), fontWeight: FontWeight.normal);
  TextStyle get headline6 =>
      _base.copyWith(fontSize: fontSize(18), fontWeight: FontWeight.w700);

  TextStyle get title => _base.copyWith(
      fontSize: fontSize(16),
      fontWeight: FontWeight.w500,
      color: SuitupTheme.color.surfaceLight);

  TextStyle get subtitle1 => _base.copyWith(
      fontSize: fontSize(16),
      fontWeight: FontWeight.w600,
      color: SuitupTheme.color.surfaceLight);
  TextStyle get subtitle2 => _base.copyWith(
      fontSize: fontSize(14),
      fontWeight: FontWeight.w600,
      color: SuitupTheme.color.surfaceLight);

  TextStyle get body1 => _base.copyWith(fontSize: fontSize(16));
  TextStyle get body2 => _base.copyWith(fontSize: fontSize(14));

  TextStyle get button =>
      _base.copyWith(fontSize: fontSize(16), fontWeight: FontWeight.w600);
  TextStyle get caption => _base.copyWith(fontSize: fontSize(14));
  TextStyle get overline => _base.copyWith(fontSize: fontSize(12));
}
