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

  bool isEqual(SuitupStatus compare) => compare == this;

  bool get isIdle => isEqual(SuitupStatus.idle);
  bool get isInitial => isEqual(SuitupStatus.initial);
  bool get isLoading => isEqual(SuitupStatus.loading);
  bool get isLoadingMore => isEqual(SuitupStatus.loadingMore);
  bool get isSuccess => isEqual(SuitupStatus.success);
  bool get isFailure => isEqual(SuitupStatus.failure);
  bool get isFinished => isEqual(SuitupStatus.finished);
  bool get isDeleting => isEqual(SuitupStatus.deleting);
  bool get isEmpty => isEqual(SuitupStatus.empty);
}
