import '../../../recipes/domain/entities/recipe.dart';
import '../../domain/entities/fridge_product.dart';

abstract class FridgeProductDataSource {
  Future<List<FridgeProduct>> getAllProducts();
  Future<void> addProduct(int id, double value);
  Future<void> makeMeal(Recipe recipe);
}
