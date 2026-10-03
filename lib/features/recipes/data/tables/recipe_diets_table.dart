import "package:drift/drift.dart";
import "recipe_table.dart";

class RecipeDietsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId => integer().references(RecipeTable, #id)();
  TextColumn get name => text()();
}