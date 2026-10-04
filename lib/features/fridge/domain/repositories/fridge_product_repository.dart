import '../../../recipes/domain/entities/recipe.dart';
import '../entities/fridge_product.dart';

abstract class FridgeProductRepository {
  Stream<List<FridgeProduct>> getAllProducts();
  Future<void> addProduct(int id, double value);
  Future<void> removeProduct(int id, double value);
  Future<void> makeMeal(Recipe recipe);
  Future<FridgeProduct> getProductByName(String name);
  Future<FridgeProduct> getProductById(int id);
}
