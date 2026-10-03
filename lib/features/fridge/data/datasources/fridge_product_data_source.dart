import '../../domain/entities/fridge_product.dart';

abstract class FridgeProductDataSource {
  Future<List<FridgeProduct>> getAllProducts();
  Future<void> addProduct(int id, double value);
}