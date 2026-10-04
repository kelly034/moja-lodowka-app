import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

import "../providers/recipes_providers.dart";
import "../widgets/recipe_card.dart";

class RecipeHome extends ConsumerWidget {
  const RecipeHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipesAsync = ref.watch(recipesProvider);
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            "Moje przepisy",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      //backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: recipesAsync.when(
        data: (recipes) => ListView(
          children: [for (final recipe in recipes) RecipeCard(recipe: recipe)],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Błąd ładowania: $err")),
      ),
    );
  }
}
