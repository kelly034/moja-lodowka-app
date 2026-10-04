import '../../../recipes/domain/entities/recipe.dart';
import '../repositories/fridge_product_repository.dart';

class MakeMealUseCase {
  final FridgeProductRepository repository;
  MakeMealUseCase(this.repository);

  Future<void> call(Recipe recipe) async {
    return await repository.makeMeal(recipe);
  }
}
