import 'package:flutter/widgets.dart';

import 'suitup_status.dart';

/// An extensible controller with auto initialize and dispose method.
abstract class SuitupController {
  /// The default status variable with [SuitupObserver] state management
  final status = ValueNotifier<SuitupStatus>(SuitupStatus.initial);

  /// Change the value of the status
  void setStatus(SuitupStatus val) => status.value = val;

  /// Implement your initialization stuff, it will run automatically
  Future<void> initialize() async {}

  /// Dispose your things automatically
  @mustCallSuper
  dispose() {
    // debug('Dispose: $runtimeType');

    status.dispose();
  }
}
