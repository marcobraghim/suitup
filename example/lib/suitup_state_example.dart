import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:suitup/suitup.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  /// Use of `SuitupState` need to register the controller on
  /// the GetIt instance
  GetIt.I.registerFactory(() => SuitupObsExampleController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: SuitupObsExample(),
        ),
      ),
    );
  }
}

/// Controller
class SuitupObsExampleController extends SuitupController {
  final myName = ValueNotifier<String?>(null);

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

  @override
  dispose() {
    super.dispose();

    myName.dispose();
  }
}

/// Page and Page state
class SuitupObsExample extends StatefulWidget {
  const SuitupObsExample({super.key});

  @override
  State<SuitupObsExample> createState() => _SuitupObsExampleState();
}

class _SuitupObsExampleState
    extends SuitupState<SuitupObsExampleController, SuitupObsExample> {
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
