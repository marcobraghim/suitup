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
}
