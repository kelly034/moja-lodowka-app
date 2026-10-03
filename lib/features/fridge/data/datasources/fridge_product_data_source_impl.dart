import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
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
}
