import '../entities/fridge_product.dart';
import '../repositories/fridge_product_repository.dart';

class GetProductByNameUseCase {
  final FridgeProductRepository repository;
  GetProductByNameUseCase(this.repository);

  Future<FridgeProduct> call(String name) async {
    return await repository.getProductByName(name);
  }
}