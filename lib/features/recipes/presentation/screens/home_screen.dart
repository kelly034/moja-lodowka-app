import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Przepisy"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            //child: IconButton(
             // icon: const Icon(Icons.settings, size: 28),
              //onPressed: () => GoRouter.of(context).push(SettingsScreen.route),
           // ),
          ),
        ],
      ),
      body: Text("lorem ipsum", style: TextStyle(fontSize: 50)),
    );
  }
}