import 'dart:async';

import 'package:async/async.dart';

class SuitupCancellable {
  CancelableOperation? completerExecution;
  DateTime lastExecution = DateTime.now();

  /// Execute a Future.
  ///
  /// This function is a sugar code used to run a Future in a simple way.
  /// Note that there's a [delay] attribute, it will hold this call and if
  /// another call comes before it finishes than the call will be canceled.
  /// BUT the last time you call this method will always run.
  ///
  /// This code was taken from [Triple](https://pub.dev/packages/flutter_triple) package
  /// so thanks to @flutterando for it.
  Future<void> execute(
    Future Function() func, {
    Duration delay = const Duration(milliseconds: 500),
    Function(Object, StackTrace)? onError,
    Function()? onCancel,
  }) async {
    final localTime = DateTime.now();
    lastExecution = localTime;

    await Future.delayed(delay);
    if (localTime.millisecond != lastExecution.millisecond) {
      return;
    }

    await completerExecution?.cancel();

    completerExecution = CancelableOperation.fromFuture(
      func(),
      onCancel: onCancel,
    );

    await completerExecution!.then((value) {}, onError: onError).valueOrCancellation();
  }

  /// This method will mark the previous request to be canceled too
  void cancel() => lastExecution = DateTime.now();
}
