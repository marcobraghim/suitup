A bunch of features and stuff to help me create awesome apps.

## Features

* Helpers
    1. `SuitupCancellable` a helper that is canceled if is called a second time
    1. `suitup_functions.dart` with some helper functions
    1. `suitup_extensions.dart` with some extension methods to make our lives easier
* State
    1. `SuitupState` to automaticaly inject the `SuitupController` on the page using `GetIt`
    1. `SuitupStatus` stands for the useful statuses like `loading`, `idle`, etc...
* Theme
    1. `SuitupTheme` to make a theme for your layout setting up the colors and typography
* Widget
    1. `SuitupObserver` to help the use of ValueNotifier/ChangeNotifier, note that it isn't a state manager, it's a shortcut for `AnimatedWidget`
    1. `SuitupNotifier` status based to watch some value that is rendered by `SuitupNotifierBuilder`
    1. `SuitupListNotifier` to make a list observable by `SuitupObserver`
    1. `SuitupTextField` to create text fields with a pre defined style

## Getting started

`flutter pub add suitup` then add the import from your dart file

```dart
import 'package:suitup/suitup.dart';
```

## Usage

One example for each functionality on the Suitup. Basically, Suitup is a 
bunch of helpers to make my life easy.

### `SuitupObserver` 

Help the use of `ValueNotifier`/`ChangeNotifier`, note that it isn't a state manager, 
it's a shortcut for `AnimatedBuilder`

```dart
import 'package:flutter/widgets.dart';
import 'package:suitup/suitup.dart';

class SuitupObsExample extends StatefulWidget {
  const SuitupObsExample({super.key});

  @override
  State<SuitupObsExample> createState() => _SuitupObsExampleState();
}

class _SuitupObsExampleState extends State<SuitupObsExample> {
  final myName = ValueNotifier<String?>(null);

  /// Do you need the same effect, but using a List?
  // final ifWasAList = SuitupListNotifier<String>(['pearl', 'apple']);

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      myName.value = 'Marco Braghim';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SuitupObserver(
      observable: myName,
      builder: (context) {
        return Text(myName.value ?? 'Unknown');
      },
    );
  }
}
```

### `SuitupNotifier` with `SuitupNotifierBuilder`

Status based `Widget` with `ValueNotifier` or `ChangeNotifier` to control the content
page workflow.

```dart
class SuitupObsExample extends StatefulWidget {
  const SuitupObsExample({super.key});

  @override
  State<SuitupObsExample> createState() => _SuitupObsExampleState();
}

class _SuitupObsExampleState extends State<SuitupObsExample> {
  final myName = SuitupNotifier<String?>(null);

  @override
  void initState() {
    super.initState();

    // Render `loading` on the builder
    Future.delayed(const Duration(seconds: 3), () => myName.setLoading());

    // Render `data` on the builder
    Future.delayed(const Duration(seconds: 6), () => myName.value = 'Marco Braghim');

    // Render `error` on the builder
    Future.delayed(const Duration(seconds: 9), () => myName.setError('The moon is not cool today'));
  }

  @override
  Widget build(BuildContext context) {
    return SuitupNotifierBuilder(
      observable: myName,
      init: (data) => const Text('Initializing...'),
      onLoading: const CupertinoActivityIndicator(),
      onData: (value) => Text('My name is: $value'),
      onError: (reason) => Text('Something went wrong: $reason'),
    );
  }
}
```

### `SuitupState`

When you have a page or screen you may need a controller for it. Suitup have some shortcut for
some of most common things about it. You create a controller extending the `SuitupController`.

What is the advantage to use `SuitupState` with the `SuitupController`?

`SuitupState` will automatically create the controller instance and call the `initialize` method
on the `initState`. Also will automatically trigger the `dispose` of the page and controller when
the page is closed.

This behavior is inpired by the package `modular` from Flutterando

```dart
// Don't forget to register the controller with the `get_it` package
GetIt.I.registerFactory(() => SuitupObsExampleController());
```

The controller
```dart 
class SuitupObsExampleController extends SuitupController {
  final myName = ValueNotifier<String?>(null);

  /// It is called automatically on the `initState` of the `SuitupState`
  @override
  Future<void> initialize() async {
    super.initialize();

    /// It is implemented on the `SuitupController` so you
    /// can use it to control the workflow on the screen
    setStatus(SuitupStatus.loading);

    Future.delayed(const Duration(seconds: 3), () {
      myName.value = 'Marco Braghim';

      setStatus(SuitupStatus.finished);
    });
  }

  /// It is called automatically by `SuitupState`
  @override
  dispose() {
    super.dispose();

    myName.dispose();
  }
}
```

The page
```dart
class SuitupObsExample extends StatefulWidget {
  const SuitupObsExample({super.key});

  @override
  State<SuitupObsExample> createState() => _SuitupObsExampleState();
}

class _SuitupObsExampleState extends SuitupState<SuitupObsExampleController, SuitupObsExample> {
  // Use `controller` to access the `SuitupObsExampleController` instance

  @override
  Widget build(BuildContext context) {
    return SuitupObserver(
      observables: [
        controller.myName,
        controller.status,
      ],
      builder: (context) {
        if (controller.status.value.isLoading) {
          return const CupertinoActivityIndicator();
        }

        return Text(controller.myName.value!);
      },
    );
  }
}
```

## Additional information

I hope this package can be so useful for you as it is for me.
