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
}