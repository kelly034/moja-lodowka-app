import "../../../recipes/domain/entities/recipe.dart";
import "../../domain/entities/fridge_product.dart";
import "../../domain/repositories/fridge_product_repository.dart";
import "../datasources/fridge_product_data_source.dart";

class FridgeProductRepositoryImpl implements FridgeProductRepository {
  final FridgeProductDataSource localDataSource;
  FridgeProductRepositoryImpl(this.localDataSource);

  @override
  Future<List<FridgeProduct>> getAllProducts() async {
    return await localDataSource.getAllProducts();
  }

  @override
  Future<void> addProduct(int id, double value) async {
    return await localDataSource.addProduct(id, value);
  }

  @override
  Future<void> makeMeal(Recipe recipe) async {
    return await localDataSource.makeMeal(recipe);
  }

  @override
  Future<FridgeProduct> getProductByName(String name) async {
    return await localDataSource.getProductByName(name);
  }
}
