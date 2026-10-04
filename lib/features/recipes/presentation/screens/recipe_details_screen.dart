import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:go_router/go_router.dart";
import "package:moja_lodowka_app/core/utils/open_in_browser.dart";

import "../../../fridge/presentation/providers/fridge_product_providers.dart";
import "../providers/recipes_providers.dart";

class RecipeDetailsScreen extends ConsumerWidget {
  final String id;
  static const route = "details";
  const RecipeDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeId = int.parse(id);
    final recipeAsync = ref.watch(recipeByIdProvider(recipeId));
    final recipeProductsAsync = ref.watch(recipeProductsProvider(recipeId));
    final makeMeal = ref.watch(makeMealUseCaseProvider);
    return recipeAsync.when(
      data: (recipe) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              recipe!.name,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.link),
                color: Theme.of(context).colorScheme.onPrimary,
                onPressed: () {
                  try {
                    openInBrowser(recipe.recipeUrl);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Card(
                    elevation: 4,
                    clipBehavior: Clip.antiAlias,
                    child: Hero(
                      tag: recipe.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          recipe.imageUrl,
                          fit: BoxFit.cover,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Składniki:",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(height: 8),
                              ...recipeProductsAsync.when(
                                data: (products) => [
                                  for (
                                    int i = 0;
                                    i < recipe.ingredientNames.length;
                                    i++
                                  )
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Text(
                                        "• ${recipe.ingredientNames[i]}: ${recipe.ingredientValues[i] % 1 == 0 ? recipe.ingredientValues[i].toInt() : recipe.ingredientValues[i]} ${products[i].unit}",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        size: 28,
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "Listę kroków możesz podejrzeć klikając ikonę w prawym górnym rogu",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                loading: () => [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ],
                                error: (error, stack) => [
                                  Text("Błąd składników: $error"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          try {
                            await makeMeal.call(recipe);
                            openInBrowser(recipe.recipeUrl);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Posiłek wykonany, produkty zostały odjęte z lodówki",
                                  ),
                                ),
                              );
                              //ref.invalidate(allProductsProvider);
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Nie masz wystarczająco składników w lodówce",
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 60),
                        ),
                        child: Text(
                          "Zrób posiłek",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      loading: () {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },

      error: (error, stackTrace) {
        return Text("wystąpił błąd: $error, $stackTrace");
      },
    );
  }
}
