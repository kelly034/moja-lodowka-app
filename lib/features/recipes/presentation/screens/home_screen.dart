import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "../../domain/entities/recipe.dart";

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Przepisy"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            //child: IconButton(
             // icon: const Icon(Icons.settings, size: 28),
              //onPressed: () => GoRouter.of(context).push(SettingsScreen.route),
           // ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          RecipeCard(recipe: Recipe(
            name: "przepis",
            diet: "asd",
            id: 1,
            imageUrl: "https://cdn.aniagotuje.com/pictures/articles/2019/08/1066517-v-1080x1315.jpg",
            ingredientNames: ["asd", "asd"],
            macroValues: [0, 0, 0, 0, 0],
          ))
        ]
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({required this.recipe, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: 400,
        height: 229,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(recipe.imageUrl, width: double.infinity, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(7),
                child: SizedBox(
                  height: 32,
                  child: Center(
                    child: Text(
                      recipe.name,
                    )
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}