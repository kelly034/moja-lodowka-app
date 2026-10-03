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
}
