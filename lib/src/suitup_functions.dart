import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// This functions is supposed to be used when you
/// want to print something on the debug console,
/// but on the VS Code it will be shown yellow
void debug(Object? message, {String? label}) {
  if (kDebugMode) {
    developer.log(
      message.toString(),
      name: label ?? 'mylog',
      time: DateTime.now(),
      sequenceNumber: DateTime.now().millisecondsSinceEpoch,
    );
  }
}

int randomInt(int start, int end) {
  if (start >= end) {
    throw "[start] number must be less than [end]";
  }

  final rnd = Random();
  return rnd.nextInt(end - start) + start;
}

/// Provides a random double number between [start] and [end]
double doubleInRange(num start, num end) {
  final rnd = Random();
  return rnd.nextDouble() * (end - start) + start;
}

/// This method will calculate the time elapsed from
/// the [start] till now.
///
/// If [echo] is true the result diff will be printed into console.
Duration executionTime(DateTime start, [bool echo = true]) {
  final diff = Duration(microseconds: DateTime.now().microsecondsSinceEpoch - start.microsecondsSinceEpoch);

  if (echo) developer.log('executionTime: $diff', name: 'mylog');

  return diff;
}

/// Returns a representation of current date as Timestamp, but in String
String get timestamp => DateTime.now().millisecondsSinceEpoch.toString();

void unfocus(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
}
