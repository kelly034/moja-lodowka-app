import 'package:drift/drift.dart';
import 'package:moja_lodowka_app/features/recipes/data/datasources/recipes_local_data_source.dart';

import '../../../../core/database/app_database.dart';
import '../../data/models/recipe_model.dart';
import '../../data/tables/recipe_table.dart';

class RecipesLocalDataSourceImpl implements RecipesLocalDataSource {
  final AppDatabase db;

  RecipesLocalDataSourceImpl(this.db);

  @override
  Future<List<RecipeModel>> getAllRecipes() async {
    final rows = await (db.select(db.recipeTable).join([
      innerJoin(
        db.recipeIngredientsTable,
        db.recipeIngredientsTable.recipeId.equalsExp(db.recipeTable.id),
      ),
    ])).get();

    final Map<RecipeTableData, List<RecipeIngredientsTableData>> grouped = {};

    for (final row in rows) {
      final recipe = row.readTable(db.recipeTable);
      final ingredient = row.readTable(db.recipeIngredientsTable);

      grouped.putIfAbsent(recipe, () => []).add(ingredient);
    }

    return grouped.entries.map((entry) {
      return RecipeModel.fromDrift(entry.key, entry.value);
    }).toList();
  }
}