# Suitup Examples

Here're one example for each functionality on the Suitup. Basically, Suitup is a 
bunch of helpers to make my life easy.

## SuitupObserver

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

## SuitupNotifier with SuitupNotifierBuilder

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
      initial: (data) => const Text('Initializing...'),
      loading: const CupertinoActivityIndicator(),
      data: (value) => Text('My name is: $value'),
      error: (reason) => Text('Something went wrong: $reason'),
    );
  }
}
```
