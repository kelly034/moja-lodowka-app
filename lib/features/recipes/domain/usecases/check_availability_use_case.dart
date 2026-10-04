import '../../../fridge/domain/repositories/fridge_product_repository.dart';
import '../entities/recipe.dart';

class CheckAvailabilityUseCase {
  final FridgeProductRepository repository;
  CheckAvailabilityUseCase(this.repository);

  Future<bool> call(Recipe recipe) async {
    final fridgeProducts = await repository.getAllProducts().first;

    final fridgeMap = {
      for (final product in fridgeProducts) product.name: product.value,
    };
    for (int i = 0; i < recipe.ingredientNames.length; i++) {
      final name = recipe.ingredientNames[i];
      final requiredAmount = recipe.ingredientValues[i];
      final availableAmount = fridgeMap[name] ?? 0.0;

      if (availableAmount < requiredAmount) return false;
    }
    return true;
  }
}