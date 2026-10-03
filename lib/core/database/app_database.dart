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

part "app_database.g.dart";

@DriftDatabase(tables: [RecipeTable, RecipeIngredientsTable, RecipeDietsTable])
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
      }
    );
  }

  Future<void> _seedDatabase() async {
    final String jsonString = await rootBundle.loadString("assets/recipes.json");
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
            fat: rawMacros[4]
          )
        );

        final ingredientNames = List<String>.from(item["ingredientNames"] ?? []);
        for (int i = 0; i < ingredientNames.length; i++) {
          await into(recipeIngredientsTable).insert(
            RecipeIngredientsTableCompanion.insert(
              recipeId: recipeId,
              name: ingredientNames[i],
            )
          );
        }

        final dietNames = List<String>.from(item["diets"] ?? []);
        for(final diet in dietNames) {
          await into(recipeDietsTable).insert(
            RecipeDietsTableCompanion.insert(
              recipeId: recipeId,
              name: diet,
            )
          );
        }
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