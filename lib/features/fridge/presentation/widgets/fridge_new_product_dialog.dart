import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/fridge_product.dart';
import '../providers/fridge_product_providers.dart';

class FridgeNewProductDialog extends HookConsumerWidget {
  const FridgeNewProductDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final addProduct = ref.watch(addProductUseCaseProvider);
    final productsAsync = ref.watch(allProductsProvider);

    final selectedProduct = useState<FridgeProduct?>(null);
    final amountController = useTextEditingController();

    return productsAsync.when(
      data: (products) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Icon(Icons.kitchen, color: colors.onPrimary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          "Dodaj nowy produkt",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colors.onPrimary,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 24, color: Colors.grey[400]),

                  Autocomplete<FridgeProduct>(
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
                      selectedProduct.value = selection;
                    },
                    fieldViewBuilder: (
                        context,
                        textEditingController,
                        focusNode,
                        onFieldSubmitted,
                        ) {
                      return TextField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        decoration: InputDecoration(
                          labelText: "Nazwa produktu",
                          hintText: "Wpisz lub wybierz z listy...",
                          labelStyle: TextStyle(color: colors.onPrimary),
                          hintStyle: TextStyle(color: colors.onPrimary),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colors.onPrimary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: colors.onPrimary, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        style: TextStyle(color: colors.onPrimary),
                      );
                    },
                  ),
                  const SizedBox(height: 16),


                  TextField(
                    controller: amountController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: "Ilość",
                      labelStyle: TextStyle(color: colors.onPrimary),
                      suffix: Text(selectedProduct.value?.unit ?? "", style: TextStyle(color: colors.onPrimary)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.onPrimary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.onPrimary, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    style: TextStyle(color: colors.onPrimary),
                  ),
                  const SizedBox(height: 24),


                  ElevatedButton(
                    onPressed: () async {
                      final amount = double.tryParse(amountController.text.replaceAll(',', '.')) ?? 0.0;
                      try {
                        await addProduct.call(selectedProduct.value?.id, amount);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Dodano produkt")),
                          );
                          ref.invalidate(allProductsProvider);
                          context.pop();
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                e.toString().replaceAll('Invalid argument(s): ', ''),
                              ),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.onPrimary,
                      foregroundColor: colors.primary,
                    ),
                    child: const Text("Dodaj do lodówki", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) {

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("wystąpił błąd: $error"),
          ),
        );
      },
      loading: () {
        return const Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}