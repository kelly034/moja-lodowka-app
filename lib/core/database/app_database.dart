import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../features/recipes/data/tables/recipe_table.dart';
import '../../features/recipes/data/tables/recipe_ingredients_table.dart';
import "../../features/recipes/data/tables/recipe_diets_table.dart";
import "../../features/fridge/data/tables/fridge_products_table.dart";

part "app_database.g.dart";

@DriftDatabase(
  tables: [
    RecipeTable,
    RecipeIngredientsTable,
    RecipeDietsTable,
    FridgeProductsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        await _seedDatabase();
      },
    );
  }

  Future<void> _seedDatabase() async {
    final String jsonString = await rootBundle.loadString(
      "assets/recipes.json",
    );
    final List<dynamic> jsonList = jsonDecode(jsonString);

    await transaction(() async {
      for (final item in jsonList) {
        final rawMacros = List<int>.from(item["macroValues"] ?? []);

        final recipeId = await into(recipeTable).insert(
          RecipeTableCompanion.insert(
            name: item["name"] as String,
            diet: item["diet"] as String? ?? "",
            imageUrl: item["imageUrl"] as String,
            recipeUrl: item["recipeUrl"] as String,
            calories: rawMacros[0],
            carbohydrates: rawMacros[1],
            sugars: rawMacros[2],
            protein: rawMacros[3],
            fat: rawMacros[4],
          ),
        );

        final ingredientNames = List<String>.from(
          item["ingredientNames"] ?? [],
        );
        final ingredientValues = List<int>.from(item["ingredientValues"] ?? []);
        for (int i = 0; i < ingredientNames.length; i++) {
          await into(recipeIngredientsTable).insert(
            RecipeIngredientsTableCompanion.insert(
              recipeId: recipeId,
              name: ingredientNames[i],
              value: ingredientValues[i],
            ),
          );
        }

        final dietNames = List<String>.from(item["diets"] ?? []);
        for (final diet in dietNames) {
          await into(recipeDietsTable).insert(
            RecipeDietsTableCompanion.insert(recipeId: recipeId, name: diet),
          );
        }

        final productNames = await rootBundle.loadString(
          "assets/products.json",
        );

        final companions = productNames
            .split("\n")
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .map((line) {
              final lastSpaceIndex = line.lastIndexOf(" ");
              if (lastSpaceIndex == -1) {
                return FridgeProductsTableCompanion.insert(
                  name: line,
                  value: 0.0,
                  unit: "szt",
                );
              }

              final name = line.substring(0, lastSpaceIndex).trim();
              final unit = line.substring(lastSpaceIndex + 1).trim();

              return FridgeProductsTableCompanion.insert(
                name: name,
                value: 0.0,
                unit: unit,
              );
            })
            .toList();

        await batch((batch) {
          batch.insertAll(fridgeProductsTable, companions);
        });
      }
    });
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "db.sqlite"));
    return NativeDatabase.createInBackground(file);
  });
}
