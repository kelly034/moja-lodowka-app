import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/fridge_product_providers.dart';

class FridgeAddProductScreen extends ConsumerWidget {
  static const route = "add_product";

  const FridgeAddProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addProduct = ref.watch(addProductUseCaseProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Dodaj produkt do lodówki")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: "Nazwa produktu"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Ilość"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Pole nie może być puste";
                } else {
                  if (int.tryParse(value) == null) {
                    return "Wpisz liczbę";
                  }
                }
                return null;
              },
            ),
          ),
          //ElevatedButton(onPressed: () {addProduct.call(id, value)}, child: Text("Dodaj"))
        ],

      ),
    );
  }
}
