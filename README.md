A bunch of features and stuff to help me create awesome apps

## Features

1. `SuitupState` to automaticaly inject the `SuitupController` on the page using `GetIt`
1. `SuitupLoading` to show up a loading widget using `flutter_easyloading`
1. `SuitupMessage` to show up messages of types `error`, `info` and `success`
1. `SuitupStatus` stands for the page statuses like `loading`, `idle`, etc...
1. `SuitupTheme` to make a theme for your layout setting up the colors and typography
1. `SuitupObserver` to help the use of ValueNotifier/ChangeNotifier, note that it isn't a state manager, it's a shortcut for `AnimatedWidget`
1. `SuitupTextField` to create text fields with a pre defined style

## Getting started

`flutter pub add suitup` then add the import from your dart file

```dart
import 'package:suitup/suitup.dart';
```

## Usage

Basicaly, everything here is just import and use it, but you can change the colors theme by calling `SuitupTheme.setup(SuitupColorAbstract)`. And so with the text theme.

To use `SuitupLoading` and `SuitupMessage` you need first to run the `SuitupLoading.initOnMain()` on your main file.

```dart
Future<void> main() async {
  // Start initializing the Firebase
  WidgetsFlutterBinding.ensureInitialized();

  SuitupLoading.initOnMain();
}
```

`SuitupObserver` acts like a state manager, but it's from Flutter itself using ValueNotifier.

```dart
final count = ValueNotifier<int>(0);
final status = ValueNotifier<SuitupStatus>(SuitupStatus.idle);

SuitupObserver(
  /// You can observe only one object
  // observable: count, 

  /// Or else you can observe a bunch of objects
  observables: [
    count,
    status,
  ],
  builder: (context) {
    /// Your implementation
  }
);
```

## Additional information

I hope this package can be so useful for you as it is for me.
