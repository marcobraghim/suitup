import 'package:flutter/widgets.dart';

import 'suitup_status.dart';

/// An extensible controller with auto initialize and dispose method.
abstract class SuitupController {
  /// The default status variable with [SuitupObserver] state management
  final status = ValueNotifier<SuitupStatus>(SuitupStatus.initial);

  /// Change the value of the status
  void setStatus(SuitupStatus val) => status.value = val;

  bool get isIdle => status.value.isIdle;
  bool get isInitial => status.value.isInitial;
  bool get isLoading => status.value.isLoading;
  bool get isLoadingMore => status.value.isLoadingMore;
  bool get isSuccess => status.value.isSuccess;
  bool get isFailure => status.value.isFailure;
  bool get isFinished => status.value.isFinished;
  bool get isSaving => status.value.isSaving;
  bool get isUpdating => status.value.isUpdating;
  bool get isDeleting => status.value.isDeleting;
  bool get isEmpty => status.value.isEmpty;

  /// Implement your initialization stuff, it will run automatically
  Future<void> initialize() async {}

  /// Dispose your things automatically
  @mustCallSuper
  dispose() {
    // debug('Dispose: $runtimeType');

    status.dispose();
  }
}
