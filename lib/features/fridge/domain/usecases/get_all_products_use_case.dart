import "../repositories/fridge_product_repository.dart";
import "../entities/fridge_product.dart";

class GetAllProductsUseCase {
  final FridgeProductRepository repository;
  GetAllProductsUseCase(this.repository);

  Stream<List<FridgeProduct>> call() {
    return repository.getAllProducts();
  }
}
