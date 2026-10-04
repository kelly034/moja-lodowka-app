import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:moja_lodowka_app/features/fridge/presentation/providers/fridge_product_providers.dart';

import '../../../../core/routing/routes.dart';
import 'fridge_add_product_screen.dart';

class FridgeHomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(allProductsProvider);
    return productsAsync.when(
      data: (products) {
        return Scaffold(
          body: ListView(
            children: [
              for (final product in products)
                if (product.value > 0)
                  Text("${product.name}: ${product.value}"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              await context.push(
                "${Routes.fridge}/${FridgeAddProductScreen.route}",
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
