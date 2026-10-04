import "package:flutter/material.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:go_router/go_router.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

import "../../domain/entities/fridge_product.dart";
import "../providers/fridge_product_providers.dart";

class FridgeAddProductDialog extends HookConsumerWidget {
  final FridgeProduct product;
  const FridgeAddProductDialog({super.key, required this.product});
  static const route = "add_product_dialog";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final addProduct = ref.watch(addProductUseCaseProvider);
    final amountController = useTextEditingController();
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisSize: .min,
            children: [
              Row(
                children: [
                  Icon(Icons.add_circle_outline, color: colors.onPrimary),
                  const SizedBox(width: 12),
                  Text(
                    "Dodaj produkt",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colors.onPrimary,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Divider(height: 24, color: Colors.grey[400]),
              FractionallySizedBox(
                alignment: .centerLeft,
                widthFactor: 0.5,
                child: TextField(
                  controller: amountController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: InputDecoration(
                    suffixText: product.unit,
                    suffixStyle: TextStyle(color: colors.onPrimary),
                    label: Text(
                      "Ilość",
                      style: TextStyle(
                        color: colors.onPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.onPrimary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colors.onPrimary, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    color: colors.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () async {
                  final amount =
                      double.tryParse(
                        amountController.text.replaceAll(',', '.'),
                      ) ??
                      0.0;
                  try {
                    await addProduct.call(product.id, amount);
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Dodano produkt")),
                      );
                      context.pop();
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          e.toString().replaceAll('Invalid argument(s): ', ''),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.onPrimary,
                ),
                child: Text(
                  "Dodaj",
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
