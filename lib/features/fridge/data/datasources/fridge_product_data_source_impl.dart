import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../recipes/domain/entities/recipe.dart';
import '../models/fridge_product_model.dart';
import 'fridge_product_data_source.dart';

class FridgeProductDataSourceImpl implements FridgeProductDataSource {
  final AppDatabase db;
  FridgeProductDataSourceImpl(this.db);

  @override
  Future<List<FridgeProductModel>> getAllProducts() async {
    final rows = await db.select(db.fridgeProductsTable).get();
    return rows.map((row) => FridgeProductModel.fromDrift(row)).toList();
  }

  @override
  Future<void> addProduct(int id, double value) async {
    final currentItem = await (db.select(
      db.fridgeProductsTable,
    )..where((tbl) => tbl.id.equals(id))).getSingle();

    await db
        .update(db.fridgeProductsTable)
        .replace(
          FridgeProductsTableCompanion(
            id: Value(id),
            value: Value(currentItem.value + value),
          ),
        );
  }

  @override
  Future<void> makeMeal(Recipe recipe) async {
    await db.transaction(() async {
      final existingProducts = await (db.select(db.fridgeProductsTable)..where((tbl) => tbl.name.isIn(recipe.ingredientNames))).get();
      await db.batch((batch) {
        final productMap = {for(var p in existingProducts) p.name: p};

        for(int i = 0; i < recipe.ingredientNames.length; i++) {
          final name = recipe.ingredientNames[i];
          final value = recipe.ingredientValues[i];
          final current = productMap[name];

          if(current != null) {
            batch.update(db.fridgeProductsTable, FridgeProductsTableCompanion(
              id: Value(current.id),
              value: Value(current.value - value),
            ),
            where: (tbl) => tbl.id.equals(current.id));
          }
        }
      });
    });
  }
}
