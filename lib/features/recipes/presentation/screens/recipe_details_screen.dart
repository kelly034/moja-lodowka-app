import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "../providers/recipes_providers.dart";

class RecipeDetailsScreen extends ConsumerWidget {
  final String id;
  static const route = "details";
  const RecipeDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipeId = int.parse(id); // bo go_router przekazuje url string
    final recipeAsync = ref.watch(recipeByIdProvider(recipeId));

    return recipeAsync.when(
      data: (recipe) {
        return Scaffold(
          //backgroundColor: Theme.of(context).colorScheme.onPrimary,
          appBar: AppBar(
            //backgroundColor: Theme.of(context).colorScheme.primary,
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
                    //color: Theme.of(context).colorScheme.primary,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Składniki",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 8),
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
                                    "• ${recipe.ingredientNames[i]}: ${recipe.ingredientValues[i] % 1 == 0 ? recipe.ingredientValues[i].toInt() : recipe.ingredientValues[i]}",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
