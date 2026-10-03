import '../entities/fridge_product.dart';

abstract class FridgeProductRepository {
  Future<List<FridgeProduct>> getAllProducts();
}