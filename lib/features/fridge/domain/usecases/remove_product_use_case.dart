import '../repositories/fridge_product_repository.dart';

class RemoveProductUseCase {
  final FridgeProductRepository repository;
  RemoveProductUseCase(this.repository);

  Future<void> call(int id, double value) async {
    final product = await repository.getProductById(id);
    if (product.value < value) {
      throw StateError("Brak wystarczającej ilości produktu w lodówce.");
    }

    return await repository.removeProduct(id, value);
  }
}
