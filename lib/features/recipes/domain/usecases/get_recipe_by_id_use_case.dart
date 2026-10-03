import '../entities/recipe.dart';
import '../repositories/recipes_repository.dart';

class GetRecipeByIdUseCase {
  final RecipesRepository repository;
  GetRecipeByIdUseCase(this.repository);

  Future<Recipe?> call(int id) async {
    return await repository.getRecipeById(id);
  }
}