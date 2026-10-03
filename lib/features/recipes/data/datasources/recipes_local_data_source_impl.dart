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
      leftOuterJoin(
        db.recipeIngredientsTable,
        db.recipeIngredientsTable.recipeId.equalsExp(db.recipeTable.id),
      ),
      leftOuterJoin(
        db.recipeDietsTable,
        db.recipeDietsTable.recipeId.equalsExp(db.recipeTable.id),
      ),
    ])).get();

    final Map<RecipeTableData, _RecipeDataHolder> grouped = {};

    for (final row in rows) {
      final recipe = row.readTable(db.recipeTable);
      final ingredient = row.readTableOrNull(db.recipeIngredientsTable);
      final diet = row.readTableOrNull(db.recipeDietsTable);

      final holder = grouped.putIfAbsent(
        recipe,
        () => _RecipeDataHolder(ingredients: {}, diets: {}),
      );

      if (ingredient != null) {
        holder.ingredients.add(ingredient);
      }
      if (diet != null) {
        holder.diets.add(diet);
      }
    }

    return grouped.entries.map((entry) {
      return RecipeModel.fromDrift(
        entry.key,
        entry.value.ingredients.toList(),
        entry.value.diets.toList(),
      );
    }).toList();
  }

  @override
  Future<RecipeModel?> getRecipeById(int id) async {
    final recipeRow = await (db.select(
      db.recipeTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

    if (recipeRow == null) return null;

    final ingredientRows = await (db.select(
      db.recipeIngredientsTable,
    )..where((tbl) => tbl.recipeId.equals(id))).get();

    final dietRows = await (db.select(
      db.recipeDietsTable,
    )..where((tbl) => tbl.recipeId.equals(id))).get();

    return RecipeModel.fromDrift(recipeRow, ingredientRows, dietRows);
  }
}

class _RecipeDataHolder {
  final Set<RecipeIngredientsTableData> ingredients;
  final Set<RecipeDietsTableData> diets;

  _RecipeDataHolder({required this.ingredients, required this.diets});
}
