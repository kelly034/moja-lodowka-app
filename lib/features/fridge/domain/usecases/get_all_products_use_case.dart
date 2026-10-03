import "../repositories/fridge_product_repository.dart";
import "../entities/fridge_product.dart";

class GetAllProductsUseCase {
  final FridgeProductRepository repository;
  GetAllProductsUseCase(this.repository);

  Future<List<FridgeProduct>> call() async {
    return await repository.getAllProducts();
  }
}
