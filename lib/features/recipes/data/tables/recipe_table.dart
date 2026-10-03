import "package:drift/drift.dart";

class RecipeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get diet => text()();
  TextColumn get imageUrl => text()();
  TextColumn get calories => text()();
  TextColumn get carbohydrates => text()();
  TextColumn get sugars => text()();
  TextColumn get protein => text()();
  TextColumn get fat => text()();
  TextColumn get recipeUrl => text()();
}
