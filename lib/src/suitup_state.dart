import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import 'suitup_controller.dart';

abstract class SuitupState<C extends SuitupController, T extends StatefulWidget> extends State<T> {
  C? _controller;

  SuitupState([SuitupController Function()? newController]) {
    if (newController != null) {
      _controller = newController() as C?;
    }
  }

  C get controller {
    assert(_controller != null,
        'The controller `${controller.runtimeType}` need to be initialized or registered on the GetIt');

    return _controller!;
  }

  /// Using [SuitupState] you DO NOT need to call the initState on the view to run the [initialize] method
  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();

    _controller ??= GetIt.I.get<C>();

    // Autorun the initialize method
    controller.initialize();
  }

  /// Using [SuitupState] you DO NOT need to call the dispose on the view
  @override
  @protected
  @mustCallSuper
  void dispose() {
    super.dispose();

    // Autorun the dispose method
    controller.dispose();
  }
}
