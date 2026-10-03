import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(context, ref){
    return Scaffold(
      body: Text("sigma"),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.restaurant), label: "Przepisy"),
          NavigationDestination(icon: Icon(Icons.kitchen), label: "Lodówka"),
      ],
    ),
    );
  }

}