import '../entities/fridge_product.dart';
import '../repositories/fridge_product_repository.dart';

class AddProductUseCase {
  final FridgeProductRepository repository;
  AddProductUseCase(this.repository);

  Future<void> call(int? id, double? value) async {
    if (id == null) {
      throw ArgumentError("Niepoprawny produkt.");
    }

    if (value == null || value <= 0) {
      throw ArgumentError("Niepoprawna ilość produktu.");
    }

    return await repository.addProduct(id, value);
  }
}
