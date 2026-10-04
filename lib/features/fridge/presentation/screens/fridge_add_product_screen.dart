import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/fridge_product.dart';
import '../providers/fridge_product_providers.dart';

class FridgeAddProductScreen extends ConsumerWidget {
  static const route = "add_product";

  const FridgeAddProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addProduct = ref.watch(addProductUseCaseProvider);
    final productsAsync = ref.watch(allProductsProvider);

    FridgeProduct? selectedProduct;
    final amountController = TextEditingController();
    return productsAsync.when(
      data: (products) {
        return Scaffold(
          appBar: AppBar(title: Text("Dodaj produkt do lodówki")),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Autocomplete<FridgeProduct>(
                  displayStringForOption: (option) => option.name,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text.isEmpty) {
                      return products;
                    }
                    return products.where(
                      (product) => product.name.toLowerCase().startsWith(
                        textEditingValue.text.toLowerCase(),
                      ),
                    );
                  },
                  onSelected: (FridgeProduct selection) {
                    selectedProduct = selection;
                  },
                  fieldViewBuilder:
                      (
                        context,
                        textEditingController,
                        focusNode,
                        onFieldSubmitted,
                      ) {
                        return TextFormField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          decoration: const InputDecoration(
                            labelText: "Nazwa produktu",
                            hintText: "Wpisz lub wybierz z listy...",
                          ),
                        );
                      },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Ilość")
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                final amount = double.tryParse(amountController.text) ?? 0.0;

                if (selectedProduct != null && amount > 0) {
                  await addProduct.call(selectedProduct!.id, amount);

                  //ref.invalidate(allProductsProvider);
                  if(context.mounted) {
                    context.pop();
                  }
                }
              },
                  child: Text("Dodaj"))
            ],
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {
        return Text("wystąpił błąd: $error, $stackTrace");
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
