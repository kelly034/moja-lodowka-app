import '../../../fridge/domain/repositories/fridge_product_repository.dart';
import '../entities/recipe.dart';
import '../repositories/recipes_repository.dart';

class GetAvailableRecipesUseCase {
  final RecipesRepository recipesRepository;
  final FridgeProductRepository fridgeProductRepository;
  GetAvailableRecipesUseCase(
    this.recipesRepository,
    this.fridgeProductRepository,
  );

  Future<List<Recipe>> call() async {
    final recipes = await recipesRepository.getAllRecipes();
    final fridgeProducts = await fridgeProductRepository.getAllProducts().first;

    final fridgeMap = {
      for (final product in fridgeProducts) product.name: product.value,
    };

    return recipes.where((recipe) {
      for (int i = 0; i < recipe.ingredientNames.length; i++) {
        final name = recipe.ingredientNames[i];
        final requiredAmount = recipe.ingredientValues[i];
        final availableAmount = fridgeMap[name] ?? 0.0;

        if (availableAmount < requiredAmount) return false;
      }
      return true;
    }).toList();
  }
}
