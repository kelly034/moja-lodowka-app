import '../entities/fridge_product.dart';
import '../repositories/fridge_product_repository.dart';

class AddProductUseCase {
  final FridgeProductRepository repository;
  AddProductUseCase(this.repository);

  Future<void> call(int id, double value) async {
    return await repository.addProduct(id, value);
  }
}
