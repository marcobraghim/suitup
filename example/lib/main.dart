import 'package:flutter/cupertino.dart';
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
  final myName = SuitupNotifier<String?>(null);

  @override
  void initState() {
    super.initState();

    // Render `loading` on the builder
    Future.delayed(const Duration(seconds: 3), () => myName.setLoading());

    // Render `data` on the builder
    Future.delayed(
        const Duration(seconds: 6), () => myName.value = 'Marco Braghim');

    // Render `error` on the builder
    Future.delayed(const Duration(seconds: 9),
        () => myName.setError('The moon is not cool today'));
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
