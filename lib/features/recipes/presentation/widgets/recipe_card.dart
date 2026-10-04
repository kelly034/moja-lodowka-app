import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

import "../../../../core/routing/routes.dart";
import "../../domain/entities/recipe.dart";
import "../screens/recipe_details_screen.dart";

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        //color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () async {
            await context.push(
              "${Routes.recipes}/${RecipeDetailsScreen.route}/${recipe.id}",
            );
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: recipe.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        recipe.imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  recipe.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onPrimary,
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
