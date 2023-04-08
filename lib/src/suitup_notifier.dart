import 'package:flutter/cupertino.dart';

enum SuitupNotifierType {
  initial,
  loading,
  data,
  error;

  bool get isInitial => this == SuitupNotifierType.initial;
  bool get isLoading => this == SuitupNotifierType.loading;
  bool get isData => this == SuitupNotifierType.data;
  bool get isError => this == SuitupNotifierType.error;
}

class SuitupNotifier<T extends Object?> extends ChangeNotifier {
  T _value;

  /// This is a special type of `Notifier`, it not only store the value with a [ChangeNotifier]
  /// but hold a status that changes depending on it.
  ///
  /// Use `SuitupNotifierBuilder` where you will get four methods that will be triggered by this status.
  ///
  /// `initial`: Before any changes on this `Notifier`
  /// `loading`: The status on the screen while this `Notifier` is on `loading` status
  /// `data`: Receive the current value and will render on the screen the main subject of this `Notifier`
  /// `error`: Give to the user a feedback when this `Notifier` have an error status
  ///
  /// Ex.:
  ///
  /// ```dart
  /// SuitupNotifierBuilder<String?>(
  ///     observable: controller.test,
  ///     initial: const Text('começando...'),
  ///     loading: const CupertinoActivityIndicator(),
  ///     data: (value) => Text(value ?? 'Tem nada não', style: SuitupTheme.text.body1),
  ///     error: (reason) => Text('Erro: $reason'),
  /// );
  /// ```
  ///
  /// Remember that, if you don't need these status changes you must need to use [SuitupObserver] with [ValueNotifier] or
  /// [ChangeNotifier]
  ///
  SuitupNotifier(this._value);

  /// Current status inside this `Notifier`.
  SuitupNotifierType status = SuitupNotifierType.initial;

  /// Private, so no one can change it directly
  String? _errorReason;

  /// User can ge the error reason directly if need
  String? get errorReason => _errorReason;

  /// The value inside this `Notifier` is updated, the status is changed to `data` and the method
  /// `Widget Function(T value) data` is called on the view from `SuitupNotifierBuilder` widget.
  ///
  /// It will only rebuild on the screen whether this new value is different from the old one.
  set value(T val) {
    if (_value == val) {
      return;
    }
    _value = val;
    setStatus(SuitupNotifierType.data);
  }

  /// Current value inside this `Notifier`
  T get value => _value;

  /// This method is kinda heart of this workflow, when the status
  /// here is changed, it can trigger which method will be built
  /// before on the `SuitupNotifierBuilder` widget on the screen
  void setStatus(SuitupNotifierType type, [String? errorReason]) {
    status = type;
    _errorReason = errorReason;
    notifyListeners();
  }

  /// Set the status as `loading`
  void setLoading() => setStatus(SuitupNotifierType.loading);

  /// Set the status as `error` and give a `reason` so it can be shown to the user somehow
  void setError(String reason) => setStatus(SuitupNotifierType.error, reason);
}

class SuitupNotifierBuilder<T extends Object?> extends StatefulWidget {
  /// The data that you want to observe, just like [ValueNotifier]
  final SuitupNotifier<T> observable;

  /// Before the [observable] take any kind of modification
  final Widget Function(T data)? initial;

  /// When the [observable] set the status as `loading`
  final Widget? loading;

  /// When changes the value of the [observable] and the status is `data`
  final Widget Function(T value) data;

  /// When there's some error on the [observable]
  final Widget Function(String reason)? error;

  /// With this [Widget] we can observe some value just like [ValueNotifier]
  /// but with some status builders that may help to render on the screen
  /// a different widget content depending on the status received.
  ///
  /// The [observable] value must to be [SuitupNotifier] type, which works
  /// exactly like the [ValueNotifier]
  const SuitupNotifierBuilder({
    super.key,
    required this.observable,
    this.initial,
    this.loading,
    required this.data,
    this.error,
  });

  @override
  State<SuitupNotifierBuilder<T>> createState() =>
      _SuitupNotifierBuilderState<T>();
}

class _SuitupNotifierBuilderState<T extends Object?>
    extends State<SuitupNotifierBuilder<T>> {
  late T value;

  @override
  void initState() {
    super.initState();
    value = widget.observable.value;
    widget.observable.addListener(_onUpdateObservable);
  }

  @override
  void didUpdateWidget(covariant SuitupNotifierBuilder<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.observable != widget.observable) {
      oldWidget.observable.removeListener(_onUpdateObservable);
      value = widget.observable.value;
      widget.observable.addListener(_onUpdateObservable);
    }
  }

  void _onUpdateObservable() {
    setState(() => value = widget.observable.value);
  }

  @override
  void dispose() {
    super.dispose();

    widget.observable.removeListener(_onUpdateObservable);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.observable.status.isInitial) {
      // User does not implemented the `initial` method, but there is
      // a value in the `widget.observable.value`, we change the status
      // to data, so the value will be delivered on the `data` method
      if (widget.initial == null && widget.observable.value != null) {
        widget.observable.status = SuitupNotifierType.data;
      } else {
        return widget.initial?.call(widget.observable.value) ??
            const SizedBox();
      }
    }

    if (widget.observable.status.isData) {
      return widget.data(widget.observable.value);
    }

    if (widget.observable.status.isLoading) {
      return widget.loading ?? const CupertinoActivityIndicator();
    }

    return widget.error?.call(widget.observable._errorReason ?? '') ??
        const SizedBox();
  }
}
