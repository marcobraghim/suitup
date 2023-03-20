import 'package:flutter/widgets.dart';

import 'suitup_status.dart';

abstract class SuitupController {
  /// The default status variable with [SuitupObserver] state management
  final status = ValueNotifier<SuitupStatus>(SuitupStatus.initial);

  void setStatus(SuitupStatus val) => status.value = val;

  Future<void> initialize() async {}

  @mustCallSuper
  dispose() {
    // debug('Dispose: $runtimeType');

    status.dispose();
  }
}
