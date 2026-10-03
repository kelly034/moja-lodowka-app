import "package:drift/drift.dart";


class RecipeTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get diet => text()();
  TextColumn get imageUrl => text()();
  IntColumn get calories => integer()();
  IntColumn get carbohydrates => integer()();
  IntColumn get sugars => integer()();
  IntColumn get protein => integer()();
  IntColumn get fat => integer()();
  TextColumn get recipeUrl => text()();
}
