import 'package:flutter/widgets.dart';

/// There is nothing here because this class is only suposed to
/// exists so the `SuitupTextAbstract` can be instantiated and
/// this abstract class allows the user to override its values
class SuitupColor extends SuitupColorAbstract {}

/// Our default values for colors
abstract class SuitupColorAbstract {
  /// COLORS **/
  final Color surface = const Color(0xFF444444);
  final Color surfaceLight = const Color(0xFF666666);
  final Color surfaceLighter = const Color(0xFFBBBBBB);
  final Color surfaceDark = const Color(0xFF121212);

  final Color contrast = const Color(0xFFF9F9F9);
  final Color contrastLight = const Color(0xFFFFFFFF);

  final Color background = const Color(0xFFF2F2F7);

  final Color primaryLighter = const Color(0xFF80bcff);
  final Color primaryLight = const Color(0xFF2a90ff);
  final Color primary = const Color(0xFF1C64F2);
  final Color primaryDark = const Color(0XFF0a3fa9);
  final Color primaryDarker = const Color(0xFF003d80);

  final Color border = const Color(0xFFE0E4F5);

  final Color red = const Color(0xFFFF3B3B);
  final Color redLight = const Color(0xFFFF5C5C);
  final Color redDark = const Color(0xFFE63535);

  final Color purple = const Color(0xFF55489d);
  final Color purpleLight = const Color(0xFFafa8d7);
  final Color purpleDark = const Color(0xFF2f2857);

  final Color green = const Color(0xFF06C270);
  final Color greenLight = const Color(0xFF39D98A);
  final Color greenDark = const Color(0xFF05A660);

  final Color blue = const Color(0xFF0063F7);
  final Color blueLight = const Color(0xFF5B8DEF);
  final Color blueDark = const Color(0xFF004FC4);

  final Color orange = const Color(0xFFFF8800);
  final Color orangeLight = const Color(0xFFFDAC42);
  final Color orangeDark = const Color(0xFFE67A00);

  final Color yellow = const Color(0xFFFFCC00);
  final Color yellowLight = const Color(0xFFFDDD48);
  final Color yellowDark = const Color(0xFFE6B800);

  final Color teal = const Color(0xFF00CFDE);
  final Color tealLight = const Color(0xFF73DFE7);
  final Color tealDark = const Color(0xFF00B7C4);
}
