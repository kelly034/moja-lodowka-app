import '../../../recipes/domain/entities/recipe.dart';
import '../repositories/fridge_product_repository.dart';

class MakeMealUseCase {
  final FridgeProductRepository repository;
  MakeMealUseCase(this.repository);

  Future<void> call(Recipe recipe) async {
    final available = await checkAvailability(repository, recipe);
    if (available) {
      return await repository.makeMeal(recipe);
    } else {
      throw StateError("Brak potrzebnych składników w lodówce.");
    }
  }
}

Future<bool> checkAvailability(
  FridgeProductRepository repository,
  Recipe recipe,
) async {
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
