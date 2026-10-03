import '../../../../core/database/app_database.dart';
import '../../domain/entities/fridge_product.dart';

class FridgeProductModel extends FridgeProduct {
  FridgeProductModel({
    required super.id,
    required super.name,
    required super.value,
    required super.unit,
  });

  factory FridgeProductModel.fromDrift(FridgeProductsTableData data) {
    return FridgeProductModel(
      id: data.id,
      name: data.name,
      value: data.value,
      unit: data.unit,
    );
  }
}