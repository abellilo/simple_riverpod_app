import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'RiverPod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value $value',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.notifier).state++,
              child: Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.notifier).state--,
              child: Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
