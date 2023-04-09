import 'suitup_color_abstract.dart';
import 'suitup_text_abstract.dart';

class SuitupTheme {
  // ------ SINGLETON ------
  SuitupTheme._internal();
  static final _instance = SuitupTheme._internal();
  static SuitupTheme get instance => _instance;
  // ------ /SINGLETON ------

  SuitupColorAbstract _color = SuitupColor();
  SuitupTextAbstract _text = SuitupText();

  static setup({
    SuitupColorAbstract? colors,
    SuitupTextAbstract? text,
  }) {
    if (colors != null) instance._color = colors;
    if (text != null) instance._text = text;
  }

  /// Colors object shortcut
  static SuitupColorAbstract get color => instance._color;

  /// Text object shortcut
  static SuitupTextAbstract get text => instance._text;
}
