import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moja_lodowka_app/features/fridge/presentation/providers/fridge_product_providers.dart';
import 'package:moja_lodowka_app/features/fridge/presentation/widgets/fridge_add_product_dialog.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../../../core/routing/routes.dart';
import '../widgets/fridge_remove_product_dialog.dart';
import '../widgets/fridge_new_product_dialog.dart';

class FridgeHomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(allProductsProvider);

    final isEditing = useState(false);
    return productsAsync.when(
      data: (products) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Moja lodówka", style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold)),
            actions: [IconButton(icon: Icon(isEditing.value ? Icons.check : Icons.edit), onPressed: () {
              isEditing.value = !isEditing.value;
            })],
          ),
          body: ListView(
            children: [
              for (final product in products)
                if (product.value > 0)
                  Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(
                        product.name,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Ilość: ${product.value % 1 == 0 ? product.value.toInt() : product.value} ${product.unit}",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      trailing: isEditing.value ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    FridgeRemoveProductDialog(product: product),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.add_circle_outline,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    FridgeAddProductDialog(product: product),
                              );
                            },
                          ),
                        ],
                      ) : null,
                    ),
                  ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const FridgeNewProductDialog(),
              );
            },
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
