import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_test/models/activity.dart';
import 'package:flutter_riverpod_test/services/random_provider.dart';
import '../models/random.dart';
import 'package:flutter_riverpod_test/services/activity_provider.dart';
import 'package:flutter_riverpod_test/services/hello_provider.dart';

class HomeScreen extends ConsumerWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final AsyncValue<Random> activity = ref.watch(activityProvider);
    // final HelloProvider val = ref.watch(helloWorldProvider);

    final AsyncValue<Random> activity = ref.watch(randomProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            // child: switch (activity) {
            //   AsyncData(:final value) => Text('Activity: ${value.data[0]}'),
            //   AsyncError(:final error) => Text('Error $error'),
            //   _ => const CircularProgressIndicator(),
            // },
            child: activity.when(
              loading: () => CircularProgressIndicator(),
              error: (error, stack) => Text('Error: $error'),
              data: (value) => Text(value.data[0].toString()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(randomProvider.notifier).updateRandomNumber();
              },
              child: const Text("Get Random Number"))
        ],
      ),
    );
  }
}
