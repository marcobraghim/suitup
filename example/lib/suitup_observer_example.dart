import 'package:flutter/material.dart';
import 'package:suitup/suitup.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
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
