import '../../../recipes/domain/entities/recipe.dart';
import '../../../recipes/domain/repositories/recipes_repository.dart';
import '../entities/fridge_product.dart';
import '../repositories/fridge_product_repository.dart';

class GetRecipeProductsUseCase {
  final FridgeProductRepository fridgeRepository;
  final RecipesRepository recipesRepository;
  GetRecipeProductsUseCase(this.fridgeRepository, this.recipesRepository);

  Future<List<FridgeProduct>> call(int id) async {
    final recipe = await recipesRepository.getRecipeById(id);
    final List<FridgeProduct> products = [];
    for (final ingredientName in recipe!.ingredientNames) {
      final product = await fridgeRepository.getProductByName(ingredientName);
      products.add(product);
    }
    return products;
  }
}