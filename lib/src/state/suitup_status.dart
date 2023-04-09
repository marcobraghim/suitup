/// Some useful statuses to be used on the screen, so you can control the workflow with it
enum SuitupStatus {
  /// When the app is doing nothing
  idle,
  initial,
  loading,
  loadingMore,
  success,
  failure,
  finished,
  deleting,
  empty;

  /// Return true when the other is equal to this instance
  bool isEqual(SuitupStatus other) => other == this;

  /// True when the current instance is `idle`
  bool get isIdle => isEqual(SuitupStatus.idle);

  /// True when the current instance is `initial`
  bool get isInitial => isEqual(SuitupStatus.initial);

  /// True when the current instance is `loading`
  bool get isLoading => isEqual(SuitupStatus.loading);

  /// True when the current instance is `loadingMore`
  bool get isLoadingMore => isEqual(SuitupStatus.loadingMore);

  /// True when the current instance is `success`
  bool get isSuccess => isEqual(SuitupStatus.success);

  /// True when the current instance is `failure`
  bool get isFailure => isEqual(SuitupStatus.failure);

  /// True when the current instance is `finished`
  bool get isFinished => isEqual(SuitupStatus.finished);

  /// True when the current instance is `deleting`
  bool get isDeleting => isEqual(SuitupStatus.deleting);

  /// True when the current instance is `empty`
  bool get isEmpty => isEqual(SuitupStatus.empty);
}
