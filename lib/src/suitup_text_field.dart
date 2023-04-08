import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'suitup_theme.dart';

class SuitupTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color? disabledColor;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final IconData? leftIcon;
  final Widget? leftWidget;
  final IconData? rightIcon;
  final Widget? rightWidget;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onSaved;
  final EdgeInsetsGeometry padding;
  final bool enabled;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final List<TextInputFormatter> inputFormatters;
  final void Function(String value)? onChanged;
  final int? maxLength;
  final int? maxLines;
  final FocusNode? focusNode;

  const SuitupTextField({
    Key? key,
    required this.controller,
    this.disabledColor,
    this.hintText,
    this.hintTextStyle,
    this.leftIcon,
    this.leftWidget,
    this.rightIcon,
    this.rightWidget,
    this.validator,
    this.onSaved,
    this.padding = EdgeInsets.zero,
    this.enabled = true,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.inputFormatters = const [],
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
    this.focusNode,
  })  : assert(leftIcon == null || leftWidget == null,
            "Can't have left Icon and left Widget at the same time"),
        assert(rightIcon == null || rightWidget == null,
            "Can't have right Icon and right Widget at the same time"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Theme(
        data: ThemeData(
          disabledColor: disabledColor,
        ),
        child: TextFormField(
          focusNode: focusNode,
          keyboardType: keyboardType,
          controller: controller,
          textInputAction: textInputAction,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          enabled: enabled,
          // expands: true,
          maxLines: maxLines,
          // minLines: null,
          maxLength: maxLength,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            // labelStyle: SuitupTheme.text.body1,
            prefixIcon: leftIcon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Icon(leftIcon!,
                              color: enabled
                                  ? SuitupTheme.color.primaryLight
                                  : SuitupTheme.color.contrast)),
                      Container(
                        width: 1,
                        height: 18,
                        margin: const EdgeInsets.only(right: 16),
                        color: SuitupTheme.color.contrast,
                      ),
                    ],
                  )
                : leftWidget,
            suffixIcon: rightIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Icon(rightIcon!,
                        color: SuitupTheme.color.contrast, size: 18))
                : rightWidget,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: SuitupTheme.color.primary,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: SuitupTheme.color.primary,
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: SuitupTheme.color.border,
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: SuitupTheme.color.border,
                width: 1,
              ),
            ),
            hintText: hintText,
            hintStyle: hintTextStyle,
            fillColor: SuitupTheme.color.contrastLight,
            filled: true,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: SuitupTheme.color.border,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: SuitupTheme.color.primary,
                width: 1,
              ),
            ),
            errorStyle: SuitupTheme.text.body1.copyWith(
              color: Colors.red[300],
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
