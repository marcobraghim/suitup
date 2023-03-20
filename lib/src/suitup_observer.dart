import 'package:flutter/material.dart';

/// This widget is just an alias to the [AnimatedBuilder]
/// because its name is not intuitive
class SuitupObserver extends AnimatedWidget {
  SuitupObserver({
    super.key,
    Listenable? observable,
    List<Listenable>? observables,
    required this.builder,
  })  : assert(observable == null || observables == null),
        super(listenable: Listenable.merge(observables ?? [observable]));

  /// Called every time the animation changes value.
  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) => builder(context);
}
